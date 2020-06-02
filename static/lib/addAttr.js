$(document).ready(function () {
})

require(['moment'], function (moment) {
    $(window).on('action:composer.submit', function (ev, data) {
        var sku = $('#sku-input').val();
        var dealUrl = $('#url-input').val();
        var brand = $('#brand-input').val();
        var price = $('#price-input').val();
        var amount = $('#amount-input').val();
        var discountPrice = $('#discount-money-input').val();
        var discountPercentage = $('#discount-percentage-input').val();
        var coupon = $('#coupon-input').val();
        var maxDiscount = $('#max-discount-money-input').val();
        var minOrder = $('#min-order-input').val();
        var currency = $('#currency-input').val();
        var expiredDate = $('#expired-date-input').val();
        var expiredTime = $('#expired-time-input').val();
        var expiredAt = null;
        var discountMoney = null;
        if(discountPrice && price && !discountPercentage){
            var dP =parseFloat(discountPrice);
            var p = parseFloat(price);
            discountPercentage = (p-dP)/p *100;
            discountPercentage = discountPercentage.toFixed(0).toString();
        }
        if(discountPrice && price){
            discountMoney = parseFloat(price) - parseFloat(discountPrice);
            discountMoney = discountMoney.toString();
        }
        if (expiredDate) {
            var strExpiredAt;
            if (!expiredTime) {
                expiredTime = "00:00 AM"
                strExpiredAt = `${expiredDate} 00:00 AM`
            }
            else if (moment(expiredTime, 'hh:mm A', true).format() != "Invalid date") {
                strExpiredAt = `${expiredDate} ${expiredTime}`
            }
            expiredAt = moment(strExpiredAt, "DD/mm/YYYY H:mm A").valueOf();
        }
        var optionalData = { sku, dealUrl, brand, price, amount, discountPrice, discountPercentage, coupon, maxDiscount, minOrder, currency, expiredDate, expiredTime, expiredAt,discountMoney }
        if (data.action === 'topics.post' || data.action === 'posts.edit') {
            data.composerData.optionalData = optionalData;
        }
    })
})
$(window).on('filter:composer.create', function (ev, data) {
    data.createData.optionalData = data.postData.optionalData
});
$(window).on('action:ajaxify.end', function (event, data) {
    // console.log(data)
    if (data.tpl_url == 'topic') {
        $.post(config.relative_path + '/composer/optional-data', { tid: $('[data-tid]').data("tid") }).done(function (res) {
            $(res).insertAfter('[component="post/header"]')
            var divider = $('.row.divider')
            if ($(divider.get(0)).next().children().length == 0) {
                // console.log("0empty")
                $(divider.get(0)).addClass('hidden')
            }
            if ($(divider.get(1)).next().children().length == 0) {
                // console.log("1empty")
                $(divider.get(1)).addClass('hidden')
            }
        })
    }
})
$(window).on('action:composer.posts.edit', function (event, data) {
    // console.log("Edit")
    location.reload(true);
})