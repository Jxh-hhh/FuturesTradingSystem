function initPage(authority,loginUsername){
    getMenu(authority);
    setSpanName(loginUsername);
}
function initMenu(authority){
    var html="";
    if(authority == "manager") {
        html += "<a href=\"background.jsp\">\n" +
            "                        <i class=\"icon-users\"></i>\n" +
            "                        <span class=\"title\">后台管理</span>\n" +
            "                        <span class=\"arrow\"></span>\n" +
            "                    </a>\n" +
            "                    <ul class=\"sub-menu\">\n" +
            "                        <li><a href=\"buy_management.jsp\">订单管理</a></li>\n" +
            "                        <li><a href=\"users_management.jsp\">用户管理</a></li>\n" +
            "                    </ul>";
        //$("#menu_admin").hide();
        jQuery("#menu_admin").html(html);
    }
}

function getMenu(authority){
    initMenu(authority);

}
function setSpanName(loginUsername){
    document.getElementById("nameSpan").innerText=loginUsername;
}