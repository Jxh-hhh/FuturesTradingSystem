function initPage(){
    getMenu();
    setSpanName()
}
function initMenu(){
    var html="";
    //var authority=result.authorityData;
    //var name="${requestScope.loginUsername}";
    var authority="<%=session.getAttribute("Authority")%>";
    //alert(authority);
    html+="<li class=\"start active \"><a href=\"index.jsp\"> <i\n" +
        "                        class=\"icon-home\"></i> <span class=\"title\">主页</span>\n" +
        "                </a></li>\n" +
        "                <li><a href=\"futures_menu.jsp\"> <i class=\"icon-graph\"></i> <span\n" +
        "                        class=\"title\">行情</span>\n" +
        "                </a>\n" +
        "                </li>\n" +
        "                <li>\n" +
        "                    <a href=\"user_information.jsp\"> <i class=\"icon-user\"></i> <span\n" +
        "                        class=\"title\">个人信息</span>\n" +
        "                </a>\n" +
        "                </li>"
    if(authority == "manager") {
        html += "<li><a href=\"background.jsp\"> <i class=\"icon-users\"></i>\n" +
            "                    <span class=\"title\">后台管理</span>\n" +
            "                    <span class=\"arrow\"></span>\n" +
            "                </a>\n" +
            "                    <ul class=\"sub-menu\">\n" +
            "                        <li><a href=\"buy_management.jsp\">订单管理</a></li>\n" +
            "                        <li><a href=\"users_management.jsp\">用户管理</a></li>\n" +
            "                    </ul>\n" +
            "                </li>"
    }
    $("#menu_div").html(html);
}

function getMenu(){
    initMenu()

}
window.onload = initPage;

function setSpanName(){
    document.getElementById("nameSpan").innerText="<%=session.getAttribute("loginUsername")%>";
}