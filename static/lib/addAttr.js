$(document).ready(function () {
})

require(['moment'], function (moment) {
    $(window).on('action:composer.submit', function (ev, data) {
        let sku = $('#sku-input').val();
        let dealUrl = $('#url-input').val();
        let brand = $('#brand-input').val();
        let price = $('#price-input').val();
        let amount = $('#amount-input').val();
        let discountPrice = $('#discount-money-input').val();
        let discountPercentage = $('#discount-percentage-input').val();
        let coupon = $('#coupon-input').val();
        let maxDiscount = $('#max-discount-money-input').val();
        let minOrder = $('#min-order-input').val();
        let currency = $('#currency-input').val();
        let expiredDate = $('#expired-date-input').val();
        let expiredTime = $('#expired-time-input').val();
        let expiredAt = null;
        let discountMoney = null;
        let images = [];
        $('#deleteImagesContainer .img-container').not('.chosen').each(function(idx, el){
            images.push($(this).find('img').attr('src'));
        });
        if(discountPrice && price && !discountPercentage){
            let dP =parseFloat(discountPrice);
            let p = parseFloat(price);
            discountPercentage = (p-dP)/p *100;
            discountPercentage = Math.round(discountPercentage*100)/100;
        }
        if(discountPrice && price){
            discountMoney = parseFloat(price) - parseFloat(discountPrice);
            discountMoney = discountMoney.toString();
        }
        if (expiredDate) {
            let strExpiredAt;
            if (!expiredTime) {
                expiredTime = "12:59 PM"
                strExpiredAt = `${expiredDate} 12:59 PM`
            }
            else if (moment(expiredTime, 'hh:mm A', true).format() != "Invalid date") {
                strExpiredAt = `${expiredDate} ${expiredTime}`
            }
            expiredAt = moment(strExpiredAt, "DD-MM-YYYY hh:mm A").valueOf();
        }
        let optionalData = {
            sku,
            dealUrl,
            brand,
            price: parseFloat(price),
            amount:parseInt(amount),
            discountPrice: parseFloat(discountPrice),
            discountPercentage: parseFloat(discountPercentage),
            coupon,
            maxDiscount: parseFloat(maxDiscount),
            minOrder: parseInt(minOrder),
            currency,
            expiredDate,
            expiredTime,
            expiredAt,
            images,
            discountMoney: parseFloat(discountMoney) }
        if (data.action === 'topics.post' || data.action === 'posts.edit') {
            data.composerData.optionalData = optionalData;
        }
    })
})
$(window).on('filter:composer.create', function (ev, data) {
    data.createData.optionalData = data.postData.optionalData
});
$(window).on('action:composer.posts.edit', function (event, data) {
    // console.log("Edit")
    location.reload(true);
})