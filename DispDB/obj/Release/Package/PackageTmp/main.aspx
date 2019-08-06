<%@ Page Language="C#" AutoEventWireup="true" CodeFile="main.aspx.cs" Inherits="main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="assets/js/jquery-1.9.1.min.js"></script>
    <title></title>
    <style>
        body {
            margin: 0px;
            padding: 0px;
            font-family: 'Segoe UI',Arial,'Microsoft Yahei',sans-serif;
            color: #000;
            letter-spacing: 1px;
            font-size: 75%;
            background: #F4F4F4;
        }
        a {
            color: #000;
            text-decoration: none;
        }
        *, *::before, *::after {
            box-sizing: inherit;
        }
        .Filter{
            background: #ECECEC;
            border-bottom: 1px solid #D8D8D8;    height: 30px;
            line-height: 30px;
            padding: 0 5px;
            position: fixed;
            width: 100%;
            margin-top: -30px;
        }
        .main{
            padding:5px;
            margin-top:30px;
        }
        h2{
            margin-left: 10px;
        }
        h3{
            margin-left: 15px;
        }
    </style>
</head>
<body>
<div class="Filter">
    版本：V-1.5.3
</div>
<div class="main" style="">
    <h2>V-1.5.3</h2>
    <h3>数据库变动查看</h3>
    <ul>
        <li>选择数据库增加历史记录，下次打开直接选择上次选择的数据库；</li>
        <li>消费贷数据库变化记录迁移；</li>
    </ul>

    <h2>V-1.5.2</h2>
    <h3>sql语句格式化</h3>
    <ul>
        <li>增加sql语句格式化功能；</li>
        <li>可以对sql语句进行格式化、美化、压缩；</li>
        <li><img src="upload/3.png" width=350></li>
    </ul>
    <h3>字符串加密</h3>
    <ul>
        <li>增加字符串加密功能；</li>
        <li>对生成的timestamp、uuid、随机数字符串进行md5、base64、hmac、sha等的加密操作</li>
        <li>可以进行多次加密</li>
        <li><img src="upload/4.png" width=350></li>
    </ul>
    <h2>V-1.5.1</h2>
    <h3>文本对比</h3>
    <ul>
        <li>增加文本对比功能；</li>
        <li>可以对比两个文本差异；</li>
        <li><img src="upload/1.png" width=350></li>
    </ul>
    <h3>JSON数据编辑</h3>
    <ul>
        <li>增加JSON数据编辑功能；</li>
        <li>json在线解析、编辑，json格式化、压缩，json格式验证；</li>
        <li><img src="upload/2.png" width=350></li>
    </ul>
    <h2>V-1.5</h2>
    <h3>数据库对比</h3>
    <ul>
        <li>重构代码，性能优化，提升加载速度至3秒内；</li>
        <li>数据库对比 更名为 <b>“变动查看”</b>；</li>
        <li>增加<b>“只显示有变动的表”</b>、<b>“快速用表名或注释筛选”</b>等提升效率功能；</li>
        <li>之前只能记录一个开发库的变动情况，增加<b>“对多个库的比对”</b>功能；</li>
        <li>增加 存储过程<img src="assets/img/icon-proc.gif">，试图<img src="assets/img/icon-view.gif"> 的比对功能及SQL语句查看比对功能；</li>
    </ul>
    <h3>库间对照</h3>
    <ul>
        <li>重构代码，性能优化，提升加载速度；</li>
        <li>数据库对照 更名为 <b>“库间对照”</b>，明确其数据库之间的表结构对照功能；</li>
        <li>增加 存储过程<img src="assets/img/icon-proc.gif">，试图<img src="assets/img/icon-view.gif"> 的比对功能及SQL语句查看比对功能；</li>
    </ul>
    <h3>表结构</h3>
    <ul>
        <li>增加表结构查看功能；</li>
        <li>实现简单的表结构查看；</li>
    </ul>
</div>
</body>
</html>