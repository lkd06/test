<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

<title>�̹��� ÷��</title>
 
<style>
.tab{
	font-size:3pt;
    width:800px;
    height:auto;
    overflow:hidden;
}
 
.tab ul{
    padding:0;
    margin:0;
    list-style:none;
    width:100%:
    height:auto;
    overflow:hidden;
}
 
.tab ul li{
    display:inline-block;
    width:16.6666%;
    float:left;
    line-height:40px;
    text-align:center;
    cursor:pointer;
}
 
.tab ul li:hover,
.tab ul li.on{
    background:#ccc;
}
 
.tab .conBox{
    width:100%;
    height:auto;
    overflow:hidden;
    min-height:200px;
    background:#ccc;
    display:none;
    text-align:center;
}
 
.tab .conBox.on{
    display:block;
}


</style>


</head>
 
<body>
<div class="tab">
    <ul>
        <li data-id="con1" class="on">����/���� ��� �ȳ�</li>
        <li data-id="con2">����ȭ, �̵���ȭ ������</li>
        <li data-id="con3">���� �⺻����</li>
        <li data-id="con4">���� ����</li>
        <li data-id="con5">���� �ȳ�</li>
        <li data-id="con6">��Ÿ</li>
    </ul>
    <div id="con1" class="conBox on">
        cont1
    </div>
    <div id="con2" class="conBox">
        cont2
    </div>
    <div id="con3" class="conBox">
        cont3
    </div>
    <div id="con4" class="conBox">
        cont4
    </div>
    <div id="con5" class="conBox">
        cont5
    </div>
    <div id="con6" class="conBox">
        cont6
    </div>
</div>
 
<script>
    $(function(){
        $(".tab ul li").click(function(){ 
            $(".tab ul li").removeClass('on');
            $(".tab .conBox").removeClass('on');
            $(this).addClass('on');
            $("#"+$(this).data('id')).addClass('on');
        });
    });
</script>

    
    
</body>
</html>
