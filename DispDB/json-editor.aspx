<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="json-editor.aspx.cs" Inherits="DispDB.json_editor" %>

<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <link rel="stylesheet" type="text/css" href="assets/js/labs/json/app.min.css">
    <script type="text/javascript" src="assets/js/labs/json/app.min.js" charset="utf-8"></script>
    <title></title>
</head>
<body class="" id="">

<div id="auto"/>
<div id="contents">
    <div id="codeEditor"></div>

    <div id="splitter">
        <div id="buttons">
            <div>
                <button id="toTree" class="convert" title="Copy code to tree editor (Ctrl + >)">
                    <div class="convert-right"></div>
                </button>
            </div>
            <div>
                <button id="toCode" class="convert" title="Copy tree to code editor (Ctrl + <)">
                    <div class="convert-left"></div>
                </button>
            </div>
        </div>
        <div id="drag">
        </div>
    </div>

    <div id="treeEditor"></div>
</div>

<script type="text/javascript">
    app.load();
    app.resize();
</script>

</body>
</html>