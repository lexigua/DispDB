var inst;
$(document).ready(function () {
    $(document).on("click", ".sync", function () {
        var sTableId = $(this).parent().parent().attr('id');
        $('.mainSave .ReturnLeft .tree').html($('.main .ReturnLeft #' + sTableId + '').clone());
        $('.mainSave .ReturnRight .tree').html($('.main .ReturnRight #' + sTableId + '').clone());
        $(".mainSave .ReturnLeft .tree").find("ul[style]").removeAttr("style");
        $(".mainSave .ReturnRight .tree").find("ul[style]").removeAttr("style");
        $('#shujuku').val(db);
        $('#biao').val(sTableId);
        inst = $('[data-remodal-id=modal]').remodal();
        inst.open();
    });
    $(document).on('click', '.remodal-save', function () {
        var fsf = $('#formSave').serialize();
        fsf += '&ModifyAfter=' + $('.mainSave .ReturnRight .tree').html().replace(/[\r\n]/g, "");
        fsf += '&ModifyBefore=' + $('.mainSave .ReturnLeft .tree').html().replace(/[\r\n]/g, "");
        //console.log(fsf);
        $.ajax({
            url: 'api/differ/saveTable.php',
            type: "post",
            data: fsf,
            datatype: 'json',
            success: function (data) {
            },
            error: function () {
                alert('澶辫触');
                $('.loading').hide();
                return false;
            }
        }).done(function (data) {
            //console.log(data);
            //console.log(data.id);
            //console.log(data.data1銆俵e);
            //console.log(data.data2);
            //鍒ゆ柇锛屾柊澧烇紝淇敼锛屽垹闄�
            if (data && data.id) {
                //鍒犻櫎鏈夊彉鍔ㄧ殑鎻愮ず
                $(".main .Return .List a:contains(" + data.id + ")").remove();
                if (data.data1.length > 0) {
                    //濡傛灉鏄慨鏀规柊澧烇紝浠庡乏杈圭洿鎺ユ嫹璐濊繃鏉�
                    $('.main .ReturnRight #' + data.id).html($('.main .ReturnLeft #' + data.id).html());
                    $('.main .ReturnLeft #' + data.id).removeClass("g").removeClass("n").removeClass("d").removeClass("te");
                    $('.main .ReturnRight #' + data.id).removeClass("g").removeClass("n").removeClass("d").removeClass("te");
                } else {
                    //濡傛灉鏄垹闄ょ殑琛紝鐩存帴鍒犻櫎瀵规瘮
                    $('.main .ReturnRight #' + data.id).remove();
                    $('.main .ReturnLeft #' + data.id).remove()
                }
            }
            inst.close();
        });
        return false;
    });
});