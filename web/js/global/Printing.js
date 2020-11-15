function jumpToPrint(id){
    window.open('printList.jsp?pageId='+id);
}


function $(selector){
    return document.querySelector(selector);
}
//获取整个页面
$("#pr").onclick =function(){
    window.print();
}

/* 实现打印全部页面（也可以打印局部页面 - 看需求） ----
      我是只打印boby里边的内容
      获取我们定义的id
   */
$("#pr").onclick =function(){
    var oldHtml = $("body").innerHTML;
    var printbox = $(".page-content-wrapper").innerHTML;
    console.log(printbox);
    $("body").innerHTML = printbox;
    window.print();
    $("body").innerHTML = oldHtml;

}
