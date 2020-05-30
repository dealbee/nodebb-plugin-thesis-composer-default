<div class="container" id="optinal-data-container">
    <div class="row">
        <span class="mr-1">
            <!-- IF price -->
            <div id="price-container">
                {price} {currency}
            </div>
            <!-- ENDIF price -->
            <!-- IF discountMoney -->
            <span id="discount-container">
                {discountMoney} {currency}
            </span>
            <!-- ENDIF discountMoney -->
        </span>
        <!-- IF discountPercentage -->
        <span id="discount-percentage-container" class="mr-1">
            {discountPercentage}% OFF
        </span>
        <!-- ENDIF discountPercentage -->
        <!-- IF dealUrl -->
        <span id="url-container" class="mr-1">
            <a href="{dealUrl}" class="btn btn-success btn-lg" target="_blank">[[thesiscomposer:visit-now]]</a>
        </span>
        <!-- ENDIF dealUrl -->
    </div>
    <div class="row divider" />
    <div class="row">
        <!-- IF brand -->
        <span id="brand-container">
            [[thesiscomposer:brand]]: <span>{brand}</span>
        </span>
        <span class="vertical-divider"></span>
        <!-- ENDIF brand -->
        <!-- IF maxDiscount -->
        <span id="max-discount-container">
            [[thesiscomposer:max-discount-money]]: <span>{maxDiscount} {currency}</span>
        </span>
        <span class="vertical-divider"></span>
        <!-- ENDIF maxDiscount -->

        <!-- IF amount -->
        <span id="amount-container">
            [[thesiscomposer:amount]]: <span>{amount}</span>
        </span>
        <span class="vertical-divider"></span>
        <!-- ENDIF amount -->

        <!-- IF minOrder -->
        <span id="min-order-container">
            [[thesiscomposer:min-order-display]]: <span>{minOrder}</span>
        </span>
        <span class="vertical-divider"></span>
        <!-- ENDIF minOrder -->
    </div>
    <div class="row divider" />
    <div class="row">
        <!-- IF expiredDate -->
        <span id="expired-date-container">
            [[thesiscomposer:end-at]]: <span>{expiredDate}</span>
        </span>
        <span class="vertical-divider"></span>
        <!-- ENDIF expiredDate -->
        <!-- IF sku -->
        <span id="sku-container">
            [[thesiscomposer:sku-display]]: <span>{sku}</span>
        </span>
        <span class="vertical-divider"></span>
        <!-- ENDIF sku -->
        <!-- IF coupon -->
        <span id="coupon-container">
            [[thesiscomposer:coupon-display]]: <span>{coupon}</span>
        </span>
        <span class="vertical-divider"></span>
        <!-- ENDIF coupon -->
    </div>
</div>