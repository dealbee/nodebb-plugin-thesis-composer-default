$(document).ready(function () {
})
$(window).on('action:composer.submit', function (ev, data) {
    var sku = $('#sku-input').val();
    var dealUrl = $('#url-input').val();
    var brand = $('#brand-input').val();
    var price = $('#price-input').val();
    var amount = $('#amount-input').val();
    var discountMoney = $('#discount-money-input').val();
    var discountPercentage = $('#discount-percentage-input').val();
    var coupon = $('#coupon-input').val();
    var maxDiscount = $('#max-discount-money-input').val();
    var minOrder = $('#min-order-input').val();
    var currency = $('#currency-input').val();
    var expiredDate = $('#expired-date-input').val();
    var optionalData = { sku, dealUrl, brand, price, amount, discountMoney, discountPercentage, coupon, maxDiscount, minOrder, currency, expiredDate }
    if (data.action === 'topics.post' || data.action === 'posts.edit') {
        data.composerData.optionalData = optionalData;
    }
})
$(window).on('filter:composer.create', function (ev, data) {
    data.createData.optionalData = data.postData.optionalData
});
$(window).on('action:ajaxify.end', function (event, data) {
    console.log(data)
    if (data.tpl_url == 'topic') {
        $.post(config.relative_path + '/composer/optional-data', { tid: $('[data-tid]').data("tid") }).done(function (res) {
            $('ul.posts li:first-child .content').prepend(res)
        })
    }
})
$(window).on('action:composer.posts.edit', function (event, data) {
    console.log("Edit")
    location.reload(true);
})