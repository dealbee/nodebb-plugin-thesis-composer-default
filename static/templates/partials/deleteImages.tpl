<!-- IF optionalData.images -->
<!-- IF optionalData.images.length -->
<div class="container">
    <label for="deleteImagesContainer">
        [[thesiscomposer:delete-images]]
    </label>
    <div class="row" id="deleteImagesContainer">
        <!-- BEGIN optionalData.images -->
        <div class="col-xs-2">
            <div class="img-container">
                <img class="img-responsive" src="{optionalData.images}"/>
            </div>
        </div>
        <!-- END optionalData.images -->
    </div>
</div>
<!-- ENDIF optionalData.images.length -->
<!-- ENDIF optionalData.images -->