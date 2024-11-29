

var inter = setInterval(function (){
    const element = document.querySelector('.HeadBackTitle');
    console.log("没有找到：")
    if (element) {
        console.log("找到了")
        clearInterval(inter);
        hiddenDiv();
    }
},100)

const hiddenDiv = ()=>{
    $(".HeadBackTitleHeight,.HeadBackTitle,.ShareClick,.ViewJobContentTips,.Ad,.ViewReportMain" +
        ",.ViewWarningMain,.ViewCollectionClick,.ApplicationPositionClick,.BackClick,.ViewHotJobMain").hide();
    // 拨打电话
    $(".JobTelApplyClick").parent().css('width', '100vw');
    // 移除打电话事件
    $(document).off('click', ".JobTelApplyClick");
    $(document).on('click', ".JobTelApplyClick", function(event) {
        var phone = $(".JobTelApplyClick").attr('href')
        window.btAction.postMessage(JSON.stringify( {
            type:"callPhone",
            phone:phone
        }));
        return false;
    })
    // 替换js文件

    $(document).off('click', ".HotJobList li a.WxLink");

// 2. 绑定你自定义的点击事件
    $(document).on('click', ".HotJobList li a.WxLink", function(event) {
        event.preventDefault(); // 阻止默认行为
        var _url = $(this).attr('href')
        var title = $(this).select(".Title").text();
        window.btAction.postMessage(JSON.stringify( {
            type:"jumpJobDetail",
            data:{
                url:_url,title:title
            }
        }));
    })

}
