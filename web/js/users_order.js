function sell(m_id){
    jQuery.ajax({
        url:'sell',
        data:{
            "m_id":m_id
        },
        type:'post',
        data_type:'json',
        global:false,
        success:function (message){
            alert(message.msg);
            window.location.href = 'users_order.jsp';
        },
        error:function (){
            console.log("提交失败");
        }
    });
}