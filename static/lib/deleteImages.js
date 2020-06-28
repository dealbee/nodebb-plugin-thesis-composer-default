$(window).on('action:composer.loaded', function (event, data) {
    $('#deleteImagesContainer .img-container').click(function () {
        if (!$(this).hasClass('chosen'))
            $(this).addClass('chosen');
        else
            $(this).removeClass('chosen');
    })
    // $('#deleteImagesBtn').click(function () {
    //     let img = [];
    //     let chosenImg = $('#deleteImagesContainer .img-container.chosen img');
    //     for (let i = 0; i < chosenImg.length; i++) {
    //         img.push($($('#deleteImagesContainer .img-container.chosen img').get(i)).attr('src'))
    //     }
    //     let dataPaths = {paths: img, isAdd: false}
    //     let tid = data.composerData.optionalData.tid;
    //     let hasFile = false;
    //     $.ajax({
    //         url: `${window.RELATIVE_PATH}/api/dealbee/topics/${tid}/update-images`,
    //         type: 'PUT',
    //         data: JSON.stringify(dataPaths),
    //         dataType: 'json',
    //         contentType: 'application/json',
    //     })
    //         .done(function (result) {
    //             $('#deleteImagesModal button.close').trigger('click')
    //             app.alert({
    //                 type: 'success',
    //                 title: '<i class="fa fa-1x fa fa-image"></i> Xóa ảnh thành công',
    //                 message: 'Trang đang được tải lại ...',
    //                 timeout: 3000
    //             });
    //             setTimeout(function () {
    //                 location.reload();
    //             }, 3000);
    //         })
    //         .fail(function () {
    //             app.alertError('Delete files fail')
    //         })
    // })
});