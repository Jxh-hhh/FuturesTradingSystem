function js_buy()
{
    getFuturesInfo();
    getCreateTime();
    getOrderId();
}

function getFuturesInfo()
{
    var gp_id = UrlParam.paramValues("gp_id");
    var gp_name = UrlParam.paramValues("gp_name");
    var gp_price = UrlParam.paramValues("gp_price");
    document.getElementById("gp_id").value = gp_id[0];
    document.getElementById("gp_name").value = gp_name[0];
    document.getElementById("gp_price").value = gp_price[0];
}

function getCreateTime()
{
    var t = new Date();//获取当前时间
    var year = t.getFullYear();//获取当前时间年份
    var month = t.getMonth();//获取当前时间月份
    var day = t.getDate();//获取当前时间日
    // var week = t.getDay();//获取当前时间星期
    // var arr = new Array ("星期一","星期二","星期三","星期四","星期五","星期六","星期日",);
    //上行是为规划星期的输出
    //下3行分别获得当前时间的时 分 秒
    var hour = t.getHours();
    var minute = t.getMinutes();
    var second = t.getSeconds();
    var nowTime = year+"-"+month+"-"+day+" "+" "+hour+((minute<10)?":0":":")+minute+((second<10)?":0":":")
        +second;
    a = document.getElementById("current_time");
    a.value = nowTime;
}

function getOrderId()
{
    var orderid = '';
    for(var i = 0; i < 16; i++){
        if(i == 0){
            orderid += Math.floor(Math.random() * 9 + 1);
        }else{
            orderid += Math.floor(Math.random() * 10);
        }
    }
    a = document.getElementById("gp_orderid");
    a.value = orderid;
}

function buy_ok() {
    $.ajax({
        url:'buy',
        data:{
            "gp_orderid": $('#gp_orderid').val(),
            "gp_id": $('#gp_id').val(),
            "gp_price": $('#gp_price').val(),
            "current_time": $('#current_time').val(),
            "gp_number": $('#gp_number').val(),
            "gp_name": $('#gp_name').val()
        },
        type:'post',
        data_type:'json',
        global:false,
        success:function (message){
            alert(message.msg);
            window.location.href="futures_menu.jsp";
        },
        error:function (){
            console.log("提交失败");
        }
    });
}