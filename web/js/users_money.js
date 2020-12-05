function deposit_ok()
{
    $.ajax({
        url:'deposit',
        data:$("#form_deposit").serialize(),
        type:'post',
        data_type:'json',
        global:false,
        success:function (){
            alert("充值成功！");
        },
        error:function (){
            console.log("提交失败");
        }
    });
}
