function initPage(authority,loginUsername){
    getMenu(authority);
    setSpanName(loginUsername);
}
function initMenu(authority){
    var html="";
    if(authority != "manager") {
        $("#menu_admin").hide();
    }
}

function getMenu(authority){
    initMenu(authority);

}
function setSpanName(loginUsername){
    document.getElementById("nameSpan").innerText=loginUsername;
}