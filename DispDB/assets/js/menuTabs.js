//閫夐」鍗�
$(function () {

    //閫氳繃閬嶅巻缁欒彍鍗曢」鍔犱笂data-index灞炴€�
    $(".J_menuItem").each(function (index) {
        if (!$(this).attr('data-index')) {
            $(this).attr('data-index', index);
        }
    });

    function menuItem() {

        // 鑾峰彇鏍囪瘑鏁版嵁
        var dataUrl = $(this).attr('href'),
            dataIndex = $(this).data('index'),
            menuName = $.trim($(this).text()),
            flag = true;

        // 閫夐」鍗¤彍鍗曞凡瀛樺湪
        $('.J_menuTab').each(function () {
            if ($(this).data('id') == dataUrl) {
                if (!$(this).hasClass('active')) {
                    $(this).addClass('active').siblings('.J_menuTab').removeClass('active');

                    // 鏄剧ずtab瀵瑰簲鐨勫唴瀹瑰尯
                    $('.J_mainContent .J_iframe').each(function () {
                        if ($(this).data('id') == dataUrl) {
                            $(this).show().siblings('.J_iframe').hide();
                            return false;
                        }
                    });
                }
                flag = false;
                return false;
            }
        });

        // 閫夐」鍗¤彍鍗曚笉瀛樺湪
        if (flag) {
            var str = '<a href="javascript:;" class="active J_menuTab" data-id="' + dataUrl + '">' + menuName + ' <i class="fa fa-times-circle">x</i></a>';
            $('.J_menuTab').removeClass('active');

            // 娣诲姞閫夐」鍗″搴旂殑iframe
            var str1 = '<iframe class="J_iframe" name="iframe' + dataIndex + '" width="100%" height="100%" src="' + dataUrl + '" frameborder="0" data-id="' + dataUrl + '" seamless></iframe>';
            $('.J_mainContent').find('iframe.J_iframe').hide().parents('.J_mainContent').append(str1);

            //鏄剧ずloading鎻愮ず
            //var loading = layer.load();

            $('.J_mainContent iframe:visible').load(function () {
                //iframe鍔犺浇瀹屾垚鍚庨殣钘弆oading鎻愮ず
                //layer.close(loading);
            });


            // 娣诲姞閫夐」鍗�
            $('.J_menuTabs .page-tabs-content').append(str);

            // 鎬诲搴�
            var countWidth = $(".content-tabs").width() - 80;

            // 鍙鍖哄煙瀹藉害
            var visibleWidth = $('.page-tabs-content').width();

            // 鍙鍖哄煙鐨勫搴﹀ぇ浜庢€诲搴�
            if (visibleWidth > countWidth) {

                // 绉诲姩鍏冪礌鐨刴arginLeft鍊�
                var marginLeftVal = parseInt($('.page-tabs-content').css('margin-left'));
                var areaWidth = visibleWidth - countWidth
                $('.page-tabs-content').animate({
                    marginLeft: '-' + areaWidth + 'px'
                }, "fast");
            }

        }

        $('.nav a.active').removeClass('active')
        $(this).addClass('active');
        //alert(dataUrl);

        return false;
    }
    $('.J_menuItem').on('click', menuItem);

    // 鍏抽棴閫夐」鍗¤彍鍗�
    function closeTab() {

        var closeTabId = $(this).parents('.J_menuTab').data('id');
        var currentWidth = $(this).parents('.J_menuTab').width();

        // 褰撳墠鍏冪礌澶勪簬娲诲姩鐘舵€�
        if ($(this).parents('.J_menuTab').hasClass('active')) {

            // 褰撳墠鍏冪礌鍚庨潰鏈夊悓杈堝厓绱狅紝浣垮悗闈㈢殑涓€涓厓绱犲浜庢椿鍔ㄧ姸鎬�
            if ($(this).parents('.J_menuTab').next('.J_menuTab').size()) {

                var activeId = $(this).parents('.J_menuTab').next('.J_menuTab:eq(0)').data('id');
                $(this).parents('.J_menuTab').next('.J_menuTab:eq(0)').addClass('active');

                $('.nav a.active').removeClass('active');
                $("a[href='" + $(this).parents('.J_menuTab').next('.J_menuTab:eq(0)').data('id') + "']").addClass('active');

                $('.J_mainContent .J_iframe').each(function () {
                    if ($(this).data('id') == activeId) {
                        $(this).show().siblings('.J_iframe').hide();
                        return false;
                    }
                });

                var marginLeftVal = parseInt($('.page-tabs-content').css('margin-left'));
                //console.log((marginLeftVal + currentWidth));
                if (marginLeftVal < 0) {
                    $('.page-tabs-content').animate({
                        marginLeft: (marginLeftVal + currentWidth) + 'px'
                    }, "fast");
                }

                //  绉婚櫎褰撳墠閫夐」鍗�
                $(this).parents('.J_menuTab').remove();

                // 绉婚櫎tab瀵瑰簲鐨勫唴瀹瑰尯
                $('.J_mainContent .J_iframe').each(function () {
                    if ($(this).data('id') == closeTabId) {
                        $(this).remove();
                        return false;
                    }
                });


            }

            // 褰撳墠鍏冪礌鍚庨潰娌℃湁鍚岃緢鍏冪礌锛屼娇褰撳墠鍏冪礌鐨勪笂涓€涓厓绱犲浜庢椿鍔ㄧ姸鎬�
            if ($(this).parents('.J_menuTab').prev('.J_menuTab').size()) {
                var activeId = $(this).parents('.J_menuTab').prev('.J_menuTab:last').data('id');
                $(this).parents('.J_menuTab').prev('.J_menuTab:last').addClass('active');
                $('.J_mainContent .J_iframe').each(function () {
                    if ($(this).data('id') == activeId) {
                        $(this).show().siblings('.J_iframe').hide();
                        return false;
                    }
                });



                $('.nav a.active').removeClass('active');
                $("a[href='" + $(this).parents('.J_menuTab').prev('.J_menuTab:last').data('id') + "']").addClass('active');

                //  绉婚櫎褰撳墠閫夐」鍗�
                $(this).parents('.J_menuTab').remove();

                // 绉婚櫎tab瀵瑰簲鐨勫唴瀹瑰尯
                $('.J_mainContent .J_iframe').each(function () {
                    if ($(this).data('id') == closeTabId) {
                        $(this).remove();
                        return false;
                    }
                });
            }

        }

        // 褰撳墠鍏冪礌涓嶅浜庢椿鍔ㄧ姸鎬�
        else {

            //  绉婚櫎褰撳墠閫夐」鍗�
            $(this).parents('.J_menuTab').remove();


            // 绉婚櫎鐩稿簲tab瀵瑰簲鐨勫唴瀹瑰尯
            $('.J_mainContent .J_iframe').each(function () {
                if ($(this).data('id') == closeTabId) {
                    $(this).remove();
                    return false;
                }
            });
        }


        // 鎬诲搴�
        var countWidth = $(".content-tabs").width() - 80;

        // 鍙鍖哄煙瀹藉害
        var visibleWidth = $('.page-tabs-content').width();

        // 绉诲姩鍏冪礌鐨刴arginLeft鍊�
        var marginLeftVal = parseInt($('.page-tabs-content').css('margin-left'));

        // 鍙鍖哄煙鐨勫搴﹀ぇ浜庢€诲搴�
        if (visibleWidth > countWidth) {

            // 宸插埌宸﹁竟
            if (marginLeftVal == 0) {
                if (visibleWidth + marginLeftVal > countWidth) {
                    $('.page-tabs-content').animate({
                        marginLeft: marginLeftVal + (-100) + 'px'
                    }, "fast");
                    //console.log(1);
                }
                return
            }

            if (marginLeftVal + 100 > 0) {
                $('.page-tabs-content').animate({
                    marginLeft: marginLeftVal - marginLeftVal + 'px'
                }, "fast");
                //console.log(2);
                return;
            }

            // 瓒呰繃宸﹁竟
            if (marginLeftVal < 0) {
                //console.log("3");
                if (visibleWidth > countWidth) {
                    //console.log("33")
                    $('.page-tabs-content').animate({
                        marginLeft: marginLeftVal + (100) + 'px'
                    }, "fast");
                    return
                }

            }

        } else if (visibleWidth < countWidth) {
            //console.log("else 1");
            if (marginLeftVal + 100 > 0) {
                $('.page-tabs-content').animate({
                    marginLeft: marginLeftVal - marginLeftVal + 'px'
                }, "fast");
                //console.log('else' + 2);
                return;
            } else {
                $('.page-tabs-content').animate({
                    marginLeft: marginLeftVal + (100) + 'px'
                }, "fast");
            }
        }

        return false;
    }
    $('.J_menuTabs').on('click', '.J_menuTab i', closeTab);

    // 鐐瑰嚮閫夐」鍗¤彍鍗�
    function activeTab() {
        if (!$(this).hasClass('active')) {
            var currentId = $(this).data('id');



            // 鏄剧ずtab瀵瑰簲鐨勫唴瀹瑰尯
            $('.J_mainContent .J_iframe').each(function () {
                if ($(this).data('id') == currentId) {
                    $(this).show().siblings('.J_iframe').hide();
                    return false;
                }
            });
            $(this).addClass('active').siblings('.J_menuTab').removeClass('active');
            //$(this).addClass('active').siblings('.J_menuTab').removeClass('active');


            $('.nav a.active').removeClass('active');
            $("a[href='" + $(this).data('id') + "']").addClass('active');



        }
    }
    $('.J_menuTabs').on('click', '.J_menuTab', activeTab);

    //鍒锋柊iframe
    function refreshTab() {

        var target = $('.J_iframe[data-id="' + $(this).data('id') + '"]');
        var url = target.attr('src');

        //鏄剧ずloading鎻愮ず
        //var loading = layer.load();

        target.attr('src', url).load(function () {

            //鍏抽棴loading鎻愮ず
            //layer.close(loading);

        });
    }
    $('.J_menuTabs').on('dblclick', '.J_menuTab', refreshTab);

    // 鍙崇Щ鎸夋壄
    $('.J_tabLeft').on('click', function () {

        // 绉诲姩鍏冪礌鐨刴arginLeft鍊�
        var marginLeftVal = parseInt($('.page-tabs-content').css('margin-left'));

        if (marginLeftVal + 400 >= 0) {
            $('.page-tabs-content').animate({
                marginLeft: marginLeftVal - marginLeftVal + 'px'
            }, "fast");
            return;

        }
        if ((marginLeftVal + 400) < 0) {
            $('.page-tabs-content').animate({
                marginLeft: marginLeftVal + 400 + 'px'
            }, "fast");

        }

    });

    // 宸︾Щ鎸夋壄
    $('.J_tabRight').on('click', function () {

        // 鎬诲搴�
        var countWidth = $(".content-tabs").width() - 80;

        // 鍙鍖哄煙瀹藉害
        var visibleWidth = $('.page-tabs-content').width();

        // 绉诲姩鍏冪礌鐨刴arginLeft鍊�
        var marginLeftVal = parseInt($('.page-tabs-content').css('margin-left'));

        // 鍙鍖哄煙鐨勫搴﹀ぇ浜庢€诲搴�
        if (visibleWidth > countWidth) {

            // 宸插埌宸﹁竟
            if (marginLeftVal == 0) {
                $('.page-tabs-content').animate({
                    marginLeft: marginLeftVal + (-400) + 'px'
                }, "fast");
            }

            // 瓒呰繃宸﹁竟
            if (marginLeftVal <= 0) {
                if (visibleWidth + marginLeftVal > countWidth)
                    $('.page-tabs-content').animate({
                        marginLeft: marginLeftVal + (-400) + 'px'
                    }, "fast");
            }

        }
    });

    $(".J_tabCloseAll").on("click", function () {
        $(".page-tabs-content").children("[data-id]").not(":first").each(function () {
            $('.J_iframe[data-id="' + $(this).data("id") + '"]').remove(),
                $(this).remove()
        }),
            $(".page-tabs-content").children("[data-id]:first").each(function () {
                $('.J_iframe[data-id="' + $(this).data("id") + '"]').show(),
                    $(this).addClass("active")
            }),
            $(".page-tabs-content").css("margin-left", "0")
    });


});