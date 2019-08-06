<%@ Page Language="C#" AutoEventWireup="true" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="assets/css/site.css" />
    <script src="assets/js/jquery-1.9.1.min.js"></script>
    <script src="assets/js/menuTabs.js"></script>
    <script src="assets/js/tab.js"></script>
    <title></title>
    <style>
        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }

        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 2% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 800px; /* Could be more or less, depending on screen size */
        }

        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

            .close:hover,
            .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }
    </style>
</head>
<body style="overflow: hidden">
    <div class="aside">
        <div class="tabs">
            <div class="tab-nav-bg">
                <ul class="tab-nav">
                    <li class="active"><a data-toggle="tab" href="#tab-1">数据库工具</a></li>
                </ul>
            </div>
            <div class="tab-content">
                <div id="tab-1" class="tab-pane active">
                    <ul class="nav" id="side-menu">
                        <li class="">
                            <img src="assets/img/f0.png" class="tbli"/>
                            <a href="#">数据库工具</a>
                            <ul style="display: block;">
                                <li>
                                    <img src="assets/img/f1.png"/>
                                    <a class="J_menuItem" href="data-browse.aspx">表结构</a></li>
                            </ul>
                        </li>
                        <li class="">
                            <img src="assets/img/f0.png" class="tbli"/> <a href="#">开发工具</a>
                            <ul style="display: block;">
                                <li><img src="assets/img/f1.png"/> <a class="J_menuItem" href="differ-txt.aspx" >文本对比</a></li>
                                <li><img src="assets/img/f1.png"/> <a class="J_menuItem" href="json-editor.aspx" >JSON数据编辑</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div id="tab-2" class="tab-pane">
                </div>
            </div>
        </div>
    </div>
    <!--<div class="split"></div>-->
    <div class="main">
        <div class="content-tabs">
            <nav class="page-tabs J_menuTabs">
                <div class="page-tabs-content">
                    <a href="javascript:;" class="active J_menuTab" data-id="main.php">首页</a>
                </div>
            </nav>
            <button class="roll-right r5 J_tabLeft"></button>
            <button class="roll-right r2 J_tabCloseAll" title="全部关闭" alt="全部关闭"></button>
            <button class="roll-right r4 J_tabRight"></button>
        </div>
        <div class="J_mainContent" id="content-main">
            <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="main.aspx" frameborder="0" data-id="main.php" seamless></iframe>
        </div>

    </div>

    <!-- The Modal -->
    <div id="myModal" class="modal">
        <!-- Modal content -->
        <div class="modal-content">
            <span class="close">&times;</span>
            <h1>新版本敬请期待.......</h1>
            <h2>新版本将重构服务器架构，原有平台将移除。如有特殊需求请及时联系运维。</h2>
            <img src="v2.gif" />
        </div>
    </div>

    <script>
        function resize() {
            var windowht = $(window).height() - 10;
            $('.aside').height(windowht);
            $('.main').height(windowht);
            $('.aside .tab-content').height($('.aside').height() - 37);
            $('.J_mainContent').height(windowht - $('.content-tabs').height());
        }
        $(document).ready(function () {
            resize();

            $('.tbli').click(function () {
                $(this).parent().toggleClass('active');
                $(this).parent().children('ul').slideToggle('fast');
            });

        });
        $(window).resize(function () {
            resize();
        });
		/*
		// Get the modal
		var modal = document.getElementById('myModal');
		// Get the button that opens the modal
		var btn = document.getElementById("myBtn");
		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];
		modal.style.display = "block";
		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
			modal.style.display = "none";
		}
		*/
    </script>
</body>
</html>
