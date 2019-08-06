<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="differ-txt.aspx.cs" Inherits="DispDB.differ_txt" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="assets/css/sub.css?v=3" />
    <script src="assets/js/jquery-1.9.1.min.js"></script>
    <link rel=stylesheet href="assets/js/labs/codemirror/lib/codemirror.css">
    <link rel=stylesheet href="assets/js/labs/codemirror/addon/merge/merge.css">
    <script src="assets/js/labs/codemirror/lib/codemirror.js"></script>
    <script src="assets/js/labs/codemirror/mode/xml/xml.js"></script>
    <script src="assets/js/labs/codemirror/addon/merge/dep/diff_match_patch.js"></script>
    <script src="assets/js/labs/codemirror/addon/merge/merge.js"></script>
    <title></title>
</head>
<body>
<div id=view></div>
<script>
var dv;
function initUI(panes) {
  var target = document.getElementById("view");
  target.innerHTML = "";
  dv = CodeMirror.MergeView(target, {
    value: "",
    orig:"",
    lineNumbers: true,
    mode: "text/html",
  });
}
function resize(){
	h = $(window).height()-5;
	$(".CodeMirror-merge").css('height',h);
	$(".CodeMirror").css('height',h);
	$(".CodeMirror-gutters").css('height',h);
}
function toggleDifferences() {
  dv.setShowDifferences(hilight = !hilight);
}


    $(document).ready(function () {
	    initUI(2);
        resize();
    });
    $(window).resize(function() {
        resize();
    });
</script>
</body>
</html>