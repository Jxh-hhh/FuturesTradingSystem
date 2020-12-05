function deposit_ok()
{
    $.ajax({
        url:'deposit',
        data:$("#form_deposit").serialize(),
        type:'post',
        data_type:'json',
        global:false,
        success:function (message){
            if( message == "2")
                alert("充值成功！");
            else if( message == "1")
                alert("充值金额不能为0!");
            else
                alert("充值金额不能小于0!");
        },
        error:function (){
            console.log("提交失败");
        }
    });
}
