<%@ Page Language="C#" AutoEventWireup="true" CodeFile="data-browse.aspx.cs" Inherits="data_browse" %>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="assets/css/sub.css?v=3" />
    <link rel="stylesheet" href="assets/js/labs/remodal.css?v=3" />
    <link rel="stylesheet" href="assets/js/labs/remodal-default-theme.css?v=3" />
    <script src="assets/js/jquery-1.9.1.min.js"></script>
    <script src="assets/js/Contains.js"></script>
    <script src="assets/js/labs/remodal.js"></script>
    <script src="assets/js/saveDiffer.js?v=3"></script>
    <title></title>
</head>
<body class="Differ" id="1529464490">
<div class="Filter">
    <form id="form">
    请选择数据库：
        <select name="db" id="db">
            <option value="192.168.100.48:BTPreservation32">192.168.100.48:BTPreservation32</option>
            <option value="192.168.100.48:BTPreservation31">192.168.100.48:BTPreservation31</option>
            <option value="192.168.100.84\SQL2012:HhdPrese">192.168.100.84\SQL2012:HhdPrese</option>
            <option value="192.168.100.140,14033:AK_Data_test">192.168.100.140,14033:AK_Data_test</option>
            <%--<option value="192.168.129.215:Temp">192.168.129.215:Temp</option>--%>
            <option value="192.168.100.20\SQL2012:BT_DCManage">电催开发192.168.100.20\SQL2012:BT_DCManage</option>
            <option value="192.168.100.85,12034:BT_DCManage">电催测试192.168.100.85,12034:BT_DCManage</option>
        </select>
        <button class="selectDb" title="">切换</button>
        |
        <button class="openAll" title="">全部展开</button>
        <button class="closeAll" title="">全部收缩</button>
        <input type="button" value="生成实体" style="width:50px;height:16px;font-size:12px;text-align:center;" />
        |
        筛选：<input id="inputSearch" type="text" class="inputSearch" title="请输入关键字">
    </form>
</div>
<div class="main" style="margin-top: 5px;">
    <div class="ReturnLeft">
        <div class="ReturnContent ">
            <ul class="tree">
            </ul>
        </div>
    </div>
    <div class="ReturnRight">
        <textarea id="outmsg" style="width:100%;height:100%;">
        </textarea>
    </div>
</div>
<div class="loading"></div>
<script>
    var db;
    var s = {};
    var h = {};
    var she = {};
    function getSql(t){
        var s;
        return s;
    }
    function getData(){
        $('.loading').show();
        $.ajax({
            url: 'AjaxHandler.ashx?action=GetDBTables',
            type: "post",
            data: $('#form').serialize(),
            datatype: 'json',
            success: function (data) {
            },
            error: function(){
                alert('失败');
                $('.loading').hide();
                return false;
            }
        }).done(function(data){
            $('.loading').hide();
            db = $('#db').val();
            differDataSource = {};
            var differSourceTable = '';
            for (var i = 0; i < data.data1.length; i++) {
                if(differSourceTable=='' || differSourceTable!=data.data1[i]['table_name']){
                    differSourceTable = data.data1[i]['table_name'];
                    differDataSource[differSourceTable]=[];
                    differDataSource[differSourceTable].push(data.data1[i]);
                }else{
                    differDataSource[differSourceTable].push(data.data1[i]);
                }
            }
            differDataHistory = {};
            var differHistoryTable = '';
            for (var i = 0; i < data.data2.length; i++) {
                if(differHistoryTable=='' || differHistoryTable!=data.data2[i]['table_name']){
                    differHistoryTable = data.data2[i]['table_name'];
                    differDataHistory[differHistoryTable]=[];
                    differDataHistory[differHistoryTable].push(data.data2[i]);
                }else{
                    differDataHistory[differHistoryTable].push(data.data2[i]);
                }
            }
            differData = {};
            $.each(differDataSource, function( key, val ) {
                if(differDataHistory.hasOwnProperty(key)){
                    differData[key] = [val,differDataHistory[key]];
                }else{
                    differData[key] = [val,-1];
                }
            });
            $.each(differDataHistory, function( key, val ) {
                if(differData.hasOwnProperty(key)){

                }else{
                    differData[key] = [-1,val];
                }
            });
            checkDiffer(differData);
            return false;
        });
    }
    function checkDiffer(data){
        var souceHtml = '<ul class="tree">';
        $.each(data, function( key, val ) {
            var sourceLiHtml = '';
            var i=0;
            differField = {};
            we=1;
            while (we==1)
            {
                if(val[0][i]==undefined && val[1][i]==undefined){
                    we=0;
                }else{
                    differField[i]=[val[0][i]];
                }
                i++;
            }
            $.each(differField, function( key1, val1 ) {
                if(val1[0]!="" && val1[0]!=undefined){
                    
                    if(val1[0]['column_key'] == '1' && val1[0]['column_biaoshi'] == '1'){
                        sourceLiHtml += '<li class="i fka';
                    }else if(val1[0]['column_key'] == '1'){
                        sourceLiHtml += '<li class="i fk';
                    }else if(val1[0]['column_biaoshi'] == '1'){
                        sourceLiHtml += '<li class="i fa';
                    }else{
                        sourceLiHtml += '<li class="i f';
                    }
                    sourceLiHtml += '">';

                    sourceLiHtml += val1[0]['column_name'];
                    sourceLiHtml += '<i>'+val1[0]['column_type'];
                    if(val1[0]["column_type"] == 'varchar' || val1[0]["column_type"] == 'nvarchar'){
                        sourceLiHtml += '(' + val1[0]["column_count"] + ')';
                    } else if(val1[0]["column_type"] == 'decimal' || val1[0]["column_type"] == 'numeric'){
                        sourceLiHtml += '(' + val1[0]["column_count"] + ',' + val1[0]["column_scale"] + ')';
                    }
                    sourceLiHtml += (val1[0]["column_isnull"] == "1" ? "?" : "");
                    sourceLiHtml += '</i> ';
                    sourceLiHtml += (val1[0]["column_value"] != "" ? '<i class="i">' + val1[0]["column_value"] + '</i>' : '');
                    sourceLiHtml += (val1[0]["column_text"] != "" ? '<i class="ii">' + val1[0]["column_text"] + '</i>' : '')
                    
                    sourceLiHtml += '</li>'
                }else{
                    sourceLiHtml += '<li class="i f"></li>';
                }
            });
            souceTableClass = '';
            if(val[0][0]!=undefined){
                if(val[0][0]['table_type']=="V"){
                    souceTableClass += " view";
                }else if(val[0][0]['table_type']=='P'){
                    souceTableClass += ' proc';
                }
                souceHtml += '<li class="i t ' + souceTableClass + '" id="' + val[0][0]['table_name'].trim() + '"><a>' + val[0][0]['table_name'].trim() + ' <i class="i">【' + val[0][0]['column_info'] + '】</i>'
                    + '</a><input class="btnst" type="button" onclick="getTableInfo()" style="width:50px;height:16px;font-size:12px;text-align:center;" value="生成实体"><ul>';
                souceHtml += sourceLiHtml+'</ul>';
            }
        });

        souceHtml += '</ul>';
        $('.ReturnLeft .ReturnContent').html(souceHtml);
    }

    function getTableInfo() {
        $('.loading').show();
        $.ajax({
            url: 'AjaxHandler.ashx?action=GetTableInfo',
            type: "post",
            data: $('#form').serialize(),
            datatype: 'json',
            success: function (data) {
                $("#outmsg").val(data);
            },
            error: function () {
                alert('失败');
                $('.loading').hide();
                return false;
            }
        }).done(function (data) {
            $('.loading').hide();            
            return false;
        });
    }

    function resize(){
        var windowht = $(window).height();
        var windowwt = ($(window).width())/2-10;
        var h = windowht-$('.Filter').height()-20;

        $('.main .ReturnLeft').height(h).width(windowwt);
        $('.main .ReturnRight').height(h).width(windowwt);

        $('.ReturnContent').height(h);
        
    }
    $(document).ready(function () {
        resize();
        //获取数据
        getData();
        $("#form").submit(function(){
            return false;
        });
        //点击展开
        $( "body" ).on( "click", ".i.t a", function() {
            var sTableId = $(this).parent().attr('id');
            $('.main .ReturnLeft #' + sTableId + ' ul').slideToggle('fast');
        });
        //展开全部
        $('.openAll').click(function () {
            $(".ReturnContent").addClass("show-column").find("ul[style]").removeAttr("style");
            return false;
        });
        //收缩全部
        $('.closeAll').click(function () {
            $(".ReturnContent").removeClass("show-column").find("ul[style]").removeAttr("style");
            return false;
        });
        //数据库切换
        $('.selectDb').click(function () {
            getData();
            return false;
        });
        //搜索
        $('#inputSearch').keypress(function(e){
            if(e.keyCode==13){
                e.preventDefault();
            }
        });
        $('#inputSearch').keyup(function() {
            if($(this).val()==''){
                $('.ReturnContent .t').show();
            }else{
                $('.ReturnContent .t').hide();
                $(".main .ReturnLeft .ReturnContent .t a:contains("+$(this).val() +")").parent().show();
            }
        });
    });
    $(window).resize(function() {
        resize();
    });
</script>
</body>
</html>
