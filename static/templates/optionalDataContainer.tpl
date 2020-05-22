<div class="fluid-container optional-data-container">
    <div class="row">
        <div class="col-xs-12 col-md-8">
            <div class="col-xs-6 pull-left optional-data-col">
                <div class="col-md-12 pull-left optional-data-label" id="price-sale-url-container">
                    <!-- IF price -->
                    <div class="pull-left mr-1" id="price-container">
                        {price} {currency}
                    </div>
                    <!-- ENDIF price -->
                    <!-- IF discountPercentage -->
                    <div class="pull-left mr-1" id="discount-percentage-container">
                        {discountPercentage}% OFF
                    </div>
                    <!-- ENDIF discountPercentage -->
                    <!-- IF dealUrl -->
                    <div class="pull-left mr-1" id="url-container">
                        <a href={dealUrl} target="_blank">Visit now!</a>
                    </div>
                    <!-- ENDIF dealUrl -->
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-md-8">
            <div class="col-md-12 pull-left optional-data-col">
                <div class="col-md-12 optional-data-label" id="discount-container">
                    <!-- IF discountMoney -->
                    <div class="pull-left mr-1">
                        Discount: {discountMoney} {currency}
                    </div>
                    <!-- ENDIF discountMoney -->
                    <!-- IF maxDiscount -->
                    <div class="pull-left mr-1">
                        Maxdiscount: {maxDiscount} {currency}
                    </div>
                    <!-- ENDIF maxDiscount -->
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12" id="brand-sku-container">
            <!-- IF brand -->
            <div class="pull-left mr-1">
                Brand: {brand}
            </div>
            <!-- ENDIF brand -->
            <!-- IF sku -->
            <div class="pull-left mr-1">
                SKU: {sku}
            </div>
            <!-- ENDIF sku -->
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-md-8">
            <!-- IF expiredDate -->
            <div class="col-xs-6 pull-left optional-data-col">
                <div class="col-xs-4 optional-data-label">
                    Expired date:
                </div>
                <div class="col-xs-8 optional-data-content">
                    {expiredDate}
                </div>
            </div>
            <!-- ENDIF expiredDate -->
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-md-8">
            <!-- IF amount -->
            <div class="col-xs-6 pull-left optional-data-col">
                <div class="col-xs-4 optional-data-label">
                    Amount:
                </div>
                <div class="col-xs-8 optional-data-content">
                    {amount}
                </div>
            </div>
            <!-- ENDIF amount -->
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-md-8">
            <!-- IF minOrder -->
            <div class="col-xs-6 pull-left optional-data-col">
                <div class="col-xs-4 optional-data-label">
                    Min order:
                </div>
                <div class="col-xs-8 optional-data-content">
                    {minOrder}
                </div>
            </div>
            <!-- ENDIF minOrder -->
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-md-8">
            <!-- IF coupon -->
            <div class="col-xs-6 pull-left optional-data-col">
                <div class="col-xs-4 optional-data-label">
                    Coupon:
                </div>
                <div class="col-xs-8 optional-data-content">
                    {coupon}
                </div>
            </div>
            <!-- ENDIF coupon -->
        </div>
    </div>
</div>