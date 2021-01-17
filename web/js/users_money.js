function deposit_ok(type)
{
    $.ajax({
        url:'deposit?type=' + type,
        data:
            $("#form_deposit").serialize(),
        type:'post',
        data_type:'json',
        global:false,
        success:function (message){
            if( message == "2"){
                alert("充值成功！");
            }
            else if( message == "1")
                alert("充值/提现金额不能为0!");
            else if( message == "0")
                alert("充值/提现金额不能小于0!");
            else if( message == "3")
                alert("提现金额大于余额！提现失败");
            else
                alert("提现成功！");
        },
        error:function (){
            console.log("提交失败");
        }
    });
}
