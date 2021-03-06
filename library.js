"use strict";

const plugins = require.main.require('./src/plugins');
const topics = require.main.require('./src/topics');
const categories = require.main.require('./src/categories');
const posts = require.main.require('./src/posts');
const user = require.main.require('./src/user');
const meta = require.main.require('./src/meta');
const privileges = require.main.require('./src/privileges');
const helpers = require.main.require('./src/controllers/helpers');
const SocketPlugins = require.main.require('./src/socket.io/plugins');
const socketMethods = require('./websockets');
const url = require('url');
const db = require.main.require('./src/database');
const async = module.parent.require('async');
const nconf = module.parent.require('nconf');
const validator = require('validator');
const translator = require.main.require('./public/src/modules/translator');
const moment = require('./static/lib/moment')
const plugin = module.exports;
const privilegeNames = {
	canTakeNote: 'editor:event:canTakeNote'
};
plugin.socketMethods = socketMethods;

plugin.init = function (data, callback) {
	var controllers = require('./controllers');
	SocketPlugins.composer = socketMethods;

	data.router.get('/admin/plugins/thesis-composer-default', data.middleware.admin.buildHeader, controllers.renderAdminPage);
	data.router.get('/api/admin/plugins/thesis-composer-default', controllers.renderAdminPage);
	data.router.post('/composer/optional-data', async function (req, res) {
		// if (!req.loggedIn) {
		// 	return res.status(400).send({ message: "No have permisson" })
		// }
		var topicData = await db.client.collection('objects').find({ _key: "topic:" + req.body.tid }).toArray();
		if (topicData[0].currency)
			topicData[0].currency = topicData[0].currency.split(" ")[0];
		if (topicData[0].price)
			topicData[0].price = parseFloat(topicData[0].price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		if (topicData[0].discountPrice)
			topicData[0].discountPrice = parseFloat(topicData[0].discountPrice).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		if (topicData[0].maxDiscount)
			topicData[0].maxDiscount = parseFloat(topicData[0].maxDiscount).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		if(topicData[0].expiredAt){
			topicData[0].expiredTime = moment(topicData[0].expiredAt).format('hh:mm A');
			topicData[0].expiredDate = moment(topicData[0].expiredAt).format('DD-MM-YYYY');
		}
		data.app.render('optionalData', topicData[0], function (err, html) {
			translator.translate(html, function (translated) {
				return res.status(200).send(translated);
			});
		})
	});

	callback();
};
plugin.privilegesList = function (list, callback) {
	callback(null, [...list, ...Object.values(privilegeNames)]);
}
plugin.privilegesGroupsList = function (list, callback) {
	callback(null, [...list, ...Object.values(privilegeNames).map(name => `groups:${name}`)]);
}

plugin.privilegesListHuman = function (list, callback) {
	callback(null, [...list, {
		name: '[[thesiscomposer:can-take-note]]'
	}]);
}
plugin.addMoreAttr = function (data, callback) {
	var newData = {
		...data.topic,
		...data.data.optionalData
	}
	data.topic = newData;
	callback(null, data);
};
plugin.getTopicInfo = async function (tid) {
	var topicData = await db.client.collection('objects').find({ _key: "topic:" + tid });
	return topicData;
}
plugin.onComposerPush = function (hookData, callback) {
	// // called when composer is opened to edit a post
	// posts.getPostField(hookData.pid, 'sku', function (err, customField) {
	// 	if (err) {
	// 		return callback(err);
	// 	}
	// 	hookData.sku = customField;
	// 	callback(null, hookData);
	// });
	async.waterfall([
		async function (next) {
			var tid = await posts.getPostField(hookData.pid, 'tid')
			var topicData = await db.client.collection('objects').find({ _key: "topic:" + tid }).toArray();
			topicData = topicData[0];
			delete topicData._id;
			delete topicData._key;
			hookData.optionalData = topicData;
			next(null, null)
		}
	], function (err, res) {
		callback(null, hookData);
	});
};
plugin.appendConfig = function (config, callback) {
	meta.settings.get('composer-default', function (err, settings) {
		if (err) {
			return callback(null, config);
		}

		config['composer-default'] = settings;
		callback(null, config);
	});
};

plugin.addAdminNavigation = function (header, callback) {
	header.plugins.push({
		route: '/plugins/thesis-composer-default',
		icon: 'fa-edit',
		name: 'Thesis Composer'
	});

	callback(null, header);
};

plugin.addPrefetchTags = function (hookData, callback) {
	var prefetch = [
		'/assets/src/modules/composer.js', '/assets/src/modules/composer/uploads.js', '/assets/src/modules/composer/drafts.js',
		'/assets/src/modules/composer/tags.js', '/assets/src/modules/composer/categoryList.js', '/assets/src/modules/composer/resize.js',
		'/assets/src/modules/composer/autocomplete.js', '/assets/templates/composer.tpl',
		'/assets/language/' + (meta.config.defaultLang || 'en-GB') + '/topic.json',
		'/assets/language/' + (meta.config.defaultLang || 'en-GB') + '/modules.json',
		'/assets/language/' + (meta.config.defaultLang || 'en-GB') + '/tags.json'
	];

	hookData.links = hookData.links.concat(prefetch.map(function (path) {
		return {
			rel: 'prefetch',
			href: nconf.get('relative_path') + path + '?' + meta.config['cache-buster']
		};
	}));

	callback(null, hookData);
};

plugin.getFormattingOptions = function (callback) {
	plugins.fireHook('filter:composer.formatting', {
		options: [
			{ name: 'tags', className: 'fa fa-tags', mobile: true },
			{ name: 'zen', className: 'fa fa-arrows-alt', title: '[[modules:composer.zen_mode]]', mobile: false }
		]
	}, function (err, payload) {
		callback(err, payload ? payload.options : null);
	});
};

plugin.build = function (data, callback) {
	var req = data.req;
	var res = data.res;
	var next = data.next;

	if (req.query.p) {
		if (!res.locals.isAPI) {
			var a;
			try {
				a = url.parse(req.query.p, true, true)
			} catch (e) {
				return helpers.redirect(res, '/');
			}
			return helpers.redirect(res, '/' + (a.path || '').replace(/^\/*/, ''));
		} else {
			res.render('', {});
			return;
		}
	} else if (!req.query.pid && !req.query.tid && !req.query.cid) {
		return helpers.redirect(res, '/');
	}

	var uid = req.uid;

	async.parallel({
		isMain: async.apply(posts.isMain, req.query.pid),
		postData: function (next) {
			if (!req.query.pid && !req.query.toPid) {
				return next();
			}

			posts.getPostData(req.query.pid || req.query.toPid, next);
		},
		topicData: function (next) {
			if (req.query.tid) {
				topics.getTopicData(req.query.tid, next);
			} else if (req.query.pid) {
				topics.getTopicDataByPid(req.query.pid, next);
			} else {
				return next();
			}
		},
		isAdmin: async.apply(user.isAdministrator, uid),
		isMod: function (next) {
			if (!uid) {
				next(null, false);
			} else if (req.query.cid) {
				user.isModerator(uid, req.query.cid, next);
			} else if (req.query.tid) {
				async.waterfall([
					async.apply(topics.getTopicField, req.query.tid, 'cid'),
					async.apply(user.isModerator, uid)
				], next);
			} else if (req.query.pid) {
				posts.isModerator(req.query.pid, uid, next);
			} else {
				next(null, false);
			}
		},
		formatting: async.apply(plugin.getFormattingOptions),
		tagWhitelist: function (next) {
			getTagWhitelist(req.query, next);
		},
		privileges: function (next) {
			privileges.global.get(uid, next);
		},
		canTag: function (next) {
			if (parseInt(req.query.cid, 10)) {
				privileges.categories.can('topics:tag', req.query.cid, req.uid, next);
			} else {
				next(null, true);
			}
		}
	}, function (err, data) {
		if (err) {
			return callback(err);
		}

		var isEditing = !!req.query.pid;
		var isGuestPost = data.postData && parseInt(data.postData.uid, 10) === 0;
		var save_id;
		var discardRoute;
		var body;

		if (uid) {
			if (req.query.cid) {
				save_id = ['composer', uid, 'cid', req.query.cid].join(':');
			} else if (req.query.tid) {
				save_id = ['composer', uid, 'tid', req.query.tid].join(':');
			} else if (req.query.pid) {
				save_id = ['composer', uid, 'pid', req.query.pid].join(':');
			}
		}

		if (req.query.cid) {
			discardRoute = nconf.get('relative_path') + '/category/' + validator.escape(String(req.query.cid));
		} else if ((req.query.tid || req.query.pid)) {
			if (data.topicData) {
				discardRoute = nconf.get('relative_path') + '/topic/' + data.topicData.slug;
			} else {
				return next();
			}
		}

		// Quoted reply
		if (req.query.toPid && parseInt(req.query.quoted, 10) === 1 && data.postData) {
			user.getUserField(data.postData.uid, 'username', function (err, username) {
				translator.translate('[[modules:composer.user_said, ' + username + ']]', function (translated) {
					body = '> ' + (data.postData ? data.postData.content.replace(/\n/g, '\n> ') + '\n\n' : '');
					body = translated + '\n' + body;
					ready();
				});
			});
		} else if (req.query.body) {
			body = req.query.body;
			ready();
		} else {
			body = data.postData ? data.postData.content : '';
			ready();
		}

		function ready() {
			var action = 'topics.post';
			if (!!req.query.tid) {
				action = 'posts.reply';
			} else if (!!req.query.pid) {
				action = 'posts.edit';
			} else {
				data.isMain = true;
			}
			data.privileges['topics:tag'] = data.canTag;
			callback(null, {
				req: req,
				res: res,
				templateData: {
					disabled: !req.query.pid && !req.query.tid && !req.query.cid,
					pid: parseInt(req.query.pid, 10),
					tid: parseInt(req.query.tid, 10),
					cid: parseInt(req.query.cid, 10) || (data.topicData ? data.topicData.cid : null),
					action: action,
					toPid: parseInt(req.query.toPid, 10),
					discardRoute: discardRoute,

					resizable: false,
					allowTopicsThumbnail: parseInt(meta.config.allowTopicsThumbnail, 10) === 1 && data.isMain,

					topicTitle: data.topicData ? data.topicData.title.replace(/%/g, '&#37;').replace(/,/g, '&#44;') : '',
					thumb: data.topicData ? data.topicData.thumb : '',
					body: body,

					isMain: data.isMain,
					isTopicOrMain: !!req.query.cid || data.isMain,
					minimumTagLength: meta.config.minimumTagLength || 3,
					maximumTagLength: meta.config.maximumTagLength || 15,
					tagWhitelist: data.tagWhitelist,
					isTopic: !!req.query.cid,
					isEditing: isEditing,
					showHandleInput: parseInt(meta.config.allowGuestHandles, 10) === 1 && (req.uid === 0 || (isEditing && isGuestPost && (data.isAdmin || data.isMod))),
					handle: data.postData ? data.postData.handle || '' : undefined,
					formatting: data.formatting,
					isAdminOrMod: data.isAdmin || data.isMod,
					save_id: save_id,
					privileges: data.privileges,
				}
			});
		}
	});
};

module.exports = plugin;
function getTagWhitelist(query, callback) {
	async.waterfall([
		function (next) {
			if (query.cid) {
				return next(null, query.cid)
			} else if (query.tid) {
				topics.getTopicField(query.tid, 'cid', next);
			} else if (query.pid) {
				posts.getCidByPid(query.pid, next);
			} else {
				next(null, null);
			}
		},
		function (cid, next) {
			categories.getTagWhitelist([cid], next);
		},
		function (tagWhitelist, next) {
			next(null, tagWhitelist[0]);
		},
	], callback);
}
