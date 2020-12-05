function deposit_ok()
{
    $.ajax({
        url:'deposit',
        data:$("#form_deposit").serialize(),
        type:'post',
        data_type:'json',
        global:false,
        success:function (){
            $("#deposit").hide();
            $("#deposit_ok").show();
        },
        error:function (){
            console.log("提交失败");
        }
    });
}
