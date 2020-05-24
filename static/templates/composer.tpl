<div component="composer" class="composer<!-- IF resizable --> resizable<!-- ENDIF resizable --><!-- IF !isTopicOrMain --> reply<!-- ENDIF !isTopicOrMain -->">

    <div class="composer-container">
        <nav class="navbar navbar-fixed-top mobile-navbar hidden-md hidden-lg">
            <div class="btn-group">
                <button class="btn btn-sm btn-primary composer-discard" data-action="discard" tabindex="-1"><i class="fa fa-times"></i></button>
                <button class="btn btn-sm btn-primary composer-minimize" data-action="minimize" tabindex="-1"><i class="fa fa-minus"></i></button>
            </div>
            <!-- IF isTopic -->
            <div class="category-name-container">
                <span class="category-name"></span> <i class="fa fa-sort"></i>
            </div>
            <!-- ENDIF isTopic -->
            <!-- IF !isTopicOrMain -->
            <h4 class="title">[[topic:composer.replying_to, "{title}"]]</h4>
            <!-- ENDIF !isTopicOrMain -->
            <div class="btn-group">
                <button class="btn btn-sm btn-primary composer-submit" data-action="post" tabindex="-1"><i class="fa fa-chevron-right"></i></button>
            </div>
        </nav>
        <div class="row title-container">
            <div class="btn-group pull-right action-bar hidden-sm hidden-xs">
                <ul class="dropdown-menu quick-search-results hidden">
                    <!-- IMPORT partials/quick-search-results.tpl -->
                </ul>
                <button class="btn btn-default composer-discard pull-right" data-action="discard" tabindex="-1"><i class="fa fa-times"></i>
                    <!--[[topic:composer.discard]]--></button>

                <button class="btn btn-primary composer-submit pull-right" data-action="post" tabindex="6"><i class="fa fa-check"></i>
                    <!--[[topic:composer.submit]]--></button>
            </div>
        </div>
        <div class="row title-container">
            <!-- IF showHandleInput -->
            <div class="col-sm-3 col-md-12">
                <input class="handle form-control" type="text" tabindex="1" placeholder="[[topic:composer.handle_placeholder]]" value="{handle}" />
            </div>
            <!-- ENDIF showHandleInput -->
            <div>
                <!-- IF isTopicOrMain -->
                <input class="title form-control" type="text" tabindex="1" placeholder="[[topic:composer.title_placeholder]]" value="{title}" />
                <!-- ELSE -->
                <span class="title form-control">[[topic:composer.replying_to, "{title}"]]</span>
                <!-- ENDIF isTopicOrMain -->
            </div>

            <!-- IF isTopic -->
            <div class="category-list-container hidden-sm hidden-xs"></div>
            <!-- ENDIF isTopic -->
            <!--
			<div class="pull-right draft-icon hidden-xs hidden-sm"></div>
			-->
        </div>
        <div class="category-tag-row">
            <div class="btn-toolbar formatting-bar">
                <ul class="formatting-group">
                    <!-- BEGIN formatting -->
                    <!-- IF formatting.spacer -->
                    <li class="spacer"></li>
                    <!-- ELSE -->
                    <!-- IF !formatting.mobile -->
                    <li tabindex="-1" data-format="{formatting.name}" title="{formatting.title}"><i class="{formatting.className}"></i></li>
                    <!-- ENDIF !formatting.mobile -->
                    <!-- ENDIF formatting.spacer -->
                    <!-- END formatting -->

                    <!--[if gte IE 9]><!-->
                    <!-- IF privileges.upload:post:image -->
                    <li class="img-upload-btn hide" data-format="picture" tabindex="-1" title="[[modules:composer.upload-picture]]">
                        <i class="fa fa-file-image-o"></i>
                    </li>
                    <!-- ENDIF privileges.upload:post:image -->
                    <!-- IF privileges.upload:post:file -->
                    <li class="file-upload-btn hide" data-format="upload" tabindex="-1" title="[[modules:composer.upload-file]]">
                        <span class="fa-stack">
                            <i class="fa fa-file-o fa-stack-1x"></i>
                            <i class="fa fa-arrow-up fa-stack-1x"></i>
                        </span>
                    </li>
                    <!-- ENDIF privileges.upload:post:file -->
                    <!--<![endif]-->
                    <form id="fileForm" method="post" enctype="multipart/form-data">
                        <!--[if gte IE 9]><!-->
                        <input type="file" id="files" name="files[]" multiple class="gte-ie9 hide" />
                        <!--<![endif]-->
                        <!--[if lt IE 9]>
							<input type="file" id="files" name="files[]" class="lt-ie9 hide" value="Upload"/>
						<![endif]-->
                    </form>
                </ul>
            </div>
        </div>
        <div class="row">
            <!-- IF allowTopicsThumbnail -->
            <form id="thumbForm" method="post" class="topic-thumb-form" enctype="multipart/form-data">
                <img class="topic-thumb-preview" src="{optionalData.thumb}"></img>
                <div class="form-group">
                    <label for="topic-thumb-url">[[topic:composer.thumb_url_label]]</label>
                    <input type="text" id="topic-thumb-url" class="form-control" placeholder="[[topic:composer.thumb_url_placeholder]]" value="{optionalData.thumb}" />
                </div>
                <div class="form-group">
                    <label for="topic-thumb-file">[[topic:composer.thumb_file_label]]</label>
                    <input type="file" id="topic-thumb-file" class="form-control" />
                </div>
                <div class="form-group topic-thumb-ctrl">
                    <i class="fa fa-spinner fa-spin hide topic-thumb-spinner" title="[[topic:composer.uploading]]"></i>
                </div>
            </form>
            <form id="optional-form">
                <div class="row">
                    <div class="form-group col-md-6">
                        <label for="price-input">Price</label>
                        <input value="{optionalData.price}" type="text" class="form-control" id="price-input" placeholder="0.00">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="currency-input">Currency</label>
                        <input value="{optionalData.currency}" type="text" class="form-control" id="currency-input" placeholder="Currency">
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">
                        <label for="brand-input">Brand</label>
                        <input value="{optionalData.brand}" type="text" class="form-control" id="brand-input" placeholder="Type brand">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="discount-percentage-input">Discount Percentage</label>
                        <input value="{optionalData.discountPercentage}" type="text" class="form-control" id="discount-percentage-input" placeholder="0.0">
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">
                        <label for="discount-money-input">Discount Money</label>
                        <input value="{optionalData.discountMoney}" type="text" class="form-control" id="discount-money-input" placeholder="0.00">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="max-discount-money-input">Max Discount Money</label>
                        <input value="{optionalData.maxDiscount}" type="text" class="form-control" id="max-discount-money-input" placeholder="0.00">
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">
                        <label for="amount-input">Amount</label>
                        <input type="text" class="form-control" id="amount-input" placeholder="Enter amount" value="{optionalData.amount}">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="min-order-input">Min Order</label>
                        <input value="{optionalData.minOrder}" type="text" class="form-control" id="min-order-input" placeholder="0">
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">
                        <label for="url-input">Deal URL</label>
                        <input type="text" class="form-control" id="url-input" placeholder="https://example.com" value="{optionalData.dealUrl}">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="expired-date-input">Expired at</label>
                        <input value="{optionalData.expiredDate}" type="text" class="form-control" id="expired-date-input" placeholder="DD-MM-YYYY">
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">
                        <label for="sku-input">SKU</label>
                        <input type="text" class="form-control" id="sku-input" placeholder="sku" value="{optionalData.sku}">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="coupon-input">Coupon</label>
                        <input value="{optionalData.coupon}" type="text" class="form-control" id="coupon-input" placeholder="Coupon">
                    </div>
                </div>
            </form>
            <!-- ENDIF allowTopicsThumbnail -->
        </div>
        <div class="row write-preview-container">
            <div class="write-container">
                <div class="help-text">
                    <span class="help hidden">[[modules:composer.compose]] <i class="fa fa-question-circle"></i></span>
                    <span class="toggle-preview hide">[[modules:composer.show_preview]]</span>
                </div>
                <div class="pull-right draft-icon hidden-md hidden-lg"></div>
                <textarea class="write" tabindex="4" rows="5"></textarea>
            </div>
        </div>
        <div class="row write-preview-container">
            <div class="hidden-sm hidden-xs preview-container">
                <div class="help-text">
                    <span class="toggle-preview">[[modules:composer.hide_preview]]</span>
                </div>
                <div class="preview well"></div>
            </div>
        </div>
        <!-- IF isTopicOrMain -->
        <div class="tag-row">
            <div class="tags-container">
                <div class="btn-group dropup <!-- IF !tagWhitelist.length -->hidden<!-- ENDIF !tagWhitelist.length -->" component="composer/tag/dropdown">
                    <button class="btn btn-default dropdown-toggle" data-toggle="dropdown" type="button">
                        <span class="visible-sm-inline visible-md-inline visible-lg-inline"><i class="fa fa-tags"></i></span>
                        <span class="caret"></span>
                    </button>

                    <ul class="dropdown-menu">
                        <!-- BEGIN tagWhitelist -->
                        <li data-tag="@value"><a href="#">@value</a></li>
                        <!-- END tagWhitelist -->
                    </ul>
                </div>
                <input class="tags" type="text" class="form-control" placeholder="[[tags:enter_tags_here, {minimumTagLength}, {maximumTagLength}]]" tabindex="5" />
            </div>
        </div>
        <!-- ENDIF isTopicOrMain -->

        <!-- IF isTopic -->
        <ul class="category-selector visible-xs visible-sm">

        </ul>
        <!-- ENDIF isTopic -->

        <div class="imagedrop">
            <div>[[topic:composer.drag_and_drop_images]]</div>
        </div>
        <!--
		<div class="resizer"><div class="trigger text-center"><i class="fa"></i></div></div>
		-->
    </div>
</div>
<script>
    app.loadJQueryUI(function() {
        $("#expired-date-input").datepicker({
            "dateFormat": "dd-mm-yy"
        });
        var currencies = ["AFN - AFGHANISTAN", "ALL - ALBANIA", "DZD - ALGERIA", "USD - AMERICAN SAMOA", "EUR - ANDORRA", "AOA - ANGOLA", "XCD - ANGUILLA", "XCD - ANTIGUA AND BARBUDA", "ARS - ARGENTINA", "AMD - ARMENIA", "AWG - ARUBA", "AUD - AUSTRALIA", "EUR - AUSTRIA", "AZN - AZERBAIJAN", "BSD - BAHAMAS (THE)", "BHD - BAHRAIN", "BDT - BANGLADESH", "BBD - BARBADOS", "BYN - BELARUS", "EUR - BELGIUM", "BZD - BELIZE", "XOF - BENIN", "BMD - BERMUDA", "BTN - BHUTAN", "INR - BHUTAN", "BOB - BOLIVIA (PLURINATIONAL STATE OF)", "BOV - BOLIVIA (PLURINATIONAL STATE OF)", "USD - BONAIRE, SINT EUSTATIUS AND SABA", "BAM - BOSNIA AND HERZEGOVINA", "BWP - BOTSWANA", "NOK - BOUVET ISLAND", "BRL - BRAZIL", "USD - BRITISH INDIAN OCEAN TERRITORY (THE)", "BND - BRUNEI DARUSSALAM", "BGN - BULGARIA", "XOF - BURKINA FASO", "BIF - BURUNDI", "CVE - CABO VERDE", "KHR - CAMBODIA", "XAF - CAMEROON", "CAD - CANADA", "KYD - CAYMAN ISLANDS (THE)", "XAF - CENTRAL AFRICAN REPUBLIC (THE)", "XAF - CHAD", "CLF - CHILE", "CLP - CHILE", "CNY - CHINA", "AUD - CHRISTMAS ISLAND", "AUD - COCOS (KEELING) ISLANDS (THE)", "COP - COLOMBIA", "COU - COLOMBIA", "KMF - COMOROS (THE)", "CDF - CONGO (THE DEMOCRATIC REPUBLIC OF THE)", "XAF - CONGO (THE)", "NZD - COOK ISLANDS (THE)", "CRC - COSTA RICA", "HRK - CROATIA", "CUC - CUBA", "CUP - CUBA", "ANG - CURAÇAO", "EUR - CYPRUS", "CZK - CZECH REPUBLIC (THE)", "XOF - CÔTE D'IVOIRE", "DKK - DENMARK", "DJF - DJIBOUTI", "XCD - DOMINICA", "DOP - DOMINICAN REPUBLIC (THE)", "USD - ECUADOR", "EGP - EGYPT", "SVC - EL SALVADOR", "USD - EL SALVADOR", "XAF - EQUATORIAL GUINEA", "ERN - ERITREA", "EUR - ESTONIA", "ETB - ETHIOPIA", "EUR - EUROPEAN UNION", "FKP - FALKLAND ISLANDS (THE) [MALVINAS]", "DKK - FAROE ISLANDS (THE)", "FJD - FIJI", "EUR - FINLAND", "EUR - FRANCE", "EUR - FRENCH GUIANA", "XPF - FRENCH POLYNESIA", "EUR - FRENCH SOUTHERN TERRITORIES (THE)", "XAF - GABON", "GMD - GAMBIA (THE)", "GEL - GEORGIA", "EUR - GERMANY", "GHS - GHANA", "GIP - GIBRALTAR", "EUR - GREECE", "DKK - GREENLAND", "XCD - GRENADA", "EUR - GUADELOUPE", "USD - GUAM", "GTQ - GUATEMALA", "GBP - GUERNSEY", "GNF - GUINEA", "XOF - GUINEA-BISSAU", "GYD - GUYANA", "HTG - HAITI", "USD - HAITI", "AUD - HEARD ISLAND AND McDONALD ISLANDS", "EUR - HOLY SEE (THE)", "HNL - HONDURAS", "HKD - HONG KONG", "HUF - HUNGARY", "ISK - ICELAND", "INR - INDIA", "IDR - INDONESIA", "XDR - INTERNATIONAL MONETARY FUND (IMF)", "IRR - IRAN (ISLAMIC REPUBLIC OF)", "IQD - IRAQ", "EUR - IRELAND", "GBP - ISLE OF MAN", "ILS - ISRAEL", "EUR - ITALY", "JMD - JAMAICA", "JPY - JAPAN", "GBP - JERSEY", "JOD - JORDAN", "KZT - KAZAKHSTAN", "KES - KENYA", "AUD - KIRIBATI", "KPW - KOREA (THE DEMOCRATIC PEOPLE’S REPUBLIC OF)", "KRW - KOREA (THE REPUBLIC OF)", "KWD - KUWAIT", "KGS - KYRGYZSTAN", "LAK - LAO PEOPLE’S DEMOCRATIC REPUBLIC (THE)", "EUR - LATVIA", "LBP - LEBANON", "LSL - LESOTHO", "ZAR - LESOTHO", "LRD - LIBERIA", "LYD - LIBYA", "CHF - LIECHTENSTEIN", "EUR - LITHUANIA", "EUR - LUXEMBOURG", "MOP - MACAO", "MGA - MADAGASCAR", "MWK - MALAWI", "MYR - MALAYSIA", "MVR - MALDIVES", "XOF - MALI", "EUR - MALTA", "USD - MARSHALL ISLANDS (THE)", "EUR - MARTINIQUE", "MRU - MAURITANIA", "MUR - MAURITIUS", "EUR - MAYOTTE", "XUA - MEMBER COUNTRIES OF THE AFRICAN DEVELOPMENT BANK GROUP", "MXN - MEXICO", "MXV - MEXICO", "USD - MICRONESIA (FEDERATED STATES OF)", "MDL - MOLDOVA (THE REPUBLIC OF)", "EUR - MONACO", "MNT - MONGOLIA", "EUR - MONTENEGRO", "XCD - MONTSERRAT", "MAD - MOROCCO", "MZN - MOZAMBIQUE", "MMK - MYANMAR", "NAD - NAMIBIA", "ZAR - NAMIBIA", "AUD - NAURU", "NPR - NEPAL", "EUR - NETHERLANDS (THE)", "XPF - NEW CALEDONIA", "NZD - NEW ZEALAND", "NIO - NICARAGUA", "XOF - NIGER (THE)", "NGN - NIGERIA", "NZD - NIUE", "AUD - NORFOLK ISLAND", "USD - NORTHERN MARIANA ISLANDS (THE)", "NOK - NORWAY", "OMR - OMAN", "PKR - PAKISTAN", "USD - PALAU", "- PALESTINE, STATE OF", "PAB - PANAMA", "USD - PANAMA", "PGK - PAPUA NEW GUINEA", "PYG - PARAGUAY", "PEN - PERU", "PHP - PHILIPPINES (THE)", "NZD - PITCAIRN", "PLN - POLAND", "EUR - PORTUGAL", "USD - PUERTO RICO", "QAR - QATAR", "MKD - REPUBLIC OF NORTH MACEDONIA", "RON - ROMANIA", "RUB - RUSSIAN FEDERATION (THE)", "RWF - RWANDA", "EUR - RÉUNION", "EUR - SAINT BARTHÉLEMY", "SHP - SAINT HELENA, ASCENSION AND TRISTAN DA CUNHA", "XCD - SAINT KITTS AND NEVIS", "XCD - SAINT LUCIA", "EUR - SAINT MARTIN (FRENCH PART)", "EUR - SAINT PIERRE AND MIQUELON", "XCD - SAINT VINCENT AND THE GRENADINES", "WST - SAMOA", "EUR - SAN MARINO", "STN - SAO TOME AND PRINCIPE", "SAR - SAUDI ARABIA", "XOF - SENEGAL", "RSD - SERBIA", "SCR - SEYCHELLES", "SLL - SIERRA LEONE", "SGD - SINGAPORE", "ANG - SINT MAARTEN (DUTCH PART)", "XSU - SISTEMA UNITARIO DE COMPENSACION REGIONAL DE PAGOS ", "EUR - SLOVAKIA", "EUR - SLOVENIA", "SBD - SOLOMON ISLANDS", "SOS - SOMALIA", "ZAR - SOUTH AFRICA", "SSP - SOUTH SUDAN", "EUR - SPAIN", "LKR - SRI LANKA", "SDG - SUDAN (THE)", "SRD - SURINAME", "NOK - SVALBARD AND JAN MAYEN", "SZL - SWAZILAND", "SEK - SWEDEN", "CHE - SWITZERLAND", "CHF - SWITZERLAND", "CHW - SWITZERLAND", "SYP - SYRIAN ARAB REPUBLIC", "TWD - TAIWAN (PROVINCE OF CHINA)", "TJS - TAJIKISTAN", "TZS - TANZANIA, UNITED REPUBLIC OF", "THB - THAILAND", "USD - TIMOR-LESTE", "XOF - TOGO", "NZD - TOKELAU", "TOP - TONGA", "TTD - TRINIDAD AND TOBAGO", "TND - TUNISIA", "TRY - TURKEY", "TMT - TURKMENISTAN", "USD - TURKS AND CAICOS ISLANDS (THE)", "AUD - TUVALU", "UGX - UGANDA", "UAH - UKRAINE", "AED - UNITED ARAB EMIRATES (THE)", "GBP - UNITED KINGDOM OF GREAT BRITAIN AND NORTHERN IRELAND (THE)", "USD - UNITED STATES MINOR OUTLYING ISLANDS (THE)", "USD - UNITED STATES OF AMERICA (THE)", "USN - UNITED STATES OF AMERICA (THE)", "UYI - URUGUAY", "UYU - URUGUAY", "UZS - UZBEKISTAN", "VUV - VANUATU", "VEF - VENEZUELA (BOLIVARIAN REPUBLIC OF)", "VND - VIET NAM", "USD - VIRGIN ISLANDS (BRITISH)", "USD - VIRGIN ISLANDS (U.S.)", "XPF - WALLIS AND FUTUNA", "MAD - WESTERN SAHARA", "YER - YEMEN", "ZMW - ZAMBIA", "ZWL - ZIMBABWE", "EUR - ALAND ISLANDS"]
        $("#currency-input").autocomplete({
            source: currencies
        });
    });
</script>
<script>
    $(document).ready(function() {
        $('#optional .modal-dialog').width($('.composer[component="composer"]').width() + 40)
    })
    $(window).on('resize', function() {
        if ($(window).width() - $('.composer[component="composer"]').width() < 1) {
            $('#optional .modal-dialog').width($('.composer[component="composer"]').width())
        } else {
            $('#optional .modal-dialog').width($('.composer[component="composer"]').width() + 40)
        }
    });
</script>