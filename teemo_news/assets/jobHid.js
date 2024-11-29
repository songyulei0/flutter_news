/*
    本JS 主要是监听菲龙网的详情页的一些按钮 的交互

    所有的按钮 都是btAction的监听。 然后通过传入不同的massess来进行区分
*/



// 监听元素出现以后再执行业务JS
function waitForElement(selector, callback) {
    const observer = new MutationObserver((mutations) => {
        const element = document.querySelector(selector);
        console.log("没有找到："+selector)
        if (element) {
            console.log("找到了"+selector)
            callback(element);
            observer.disconnect(); // 停止观察
        }
    });

    // 开始观察整个 document
    observer.observe(document.documentElement, {
        childList: true,
        subtree: true
    });
}

// 使用示例
// waitForElement('#modal', (element) => {
//     console.log('follow_action 按钮已经出现,等待3秒再执行', element);
//
// });

var inter = setInterval(function (){
    const element = document.querySelector('.FixedWebNav');
    if (element) {
        clearInterval(inter);
        followActionBtn();
    }

},100)





const followActionBtn = ()=>{
    let element = document.getElementById("overlay");

    element.style.display = "none";


    $(".IndexHotMain,.IndexSearchNav").hide();

    let modal = document.getElementById("modal");
    modal.style.display = "none";


    let elements = document.getElementsByClassName("Ad");
    for (let i = 0; i < elements.length; i++) {
        elements[i].style.display = "none";
    }

    let More = document.getElementsByClassName("More");
    for (let i = 0; i < More.length; i++) {
        More[i].style.display = "none";
    }


    let elements2 = document.getElementsByClassName("FixedWebNav");
    for (let i = 0; i < elements2.length; i++) {
        elements2[i].style.display = "none";
    }

    // 替换js文件

    $(document).off('click', ".JobList li a.WxLink");

// 2. 绑定你自定义的点击事件
    $(document).on('click', ".JobList li a.WxLink", function(event) {
        event.preventDefault(); // 阻止默认行为
        var _url = $(this).attr('href')
        var title = $(this).select(".Title").text();
        window.btAction.postMessage(JSON.stringify({
            url:_url,title:title
        }));
    })
}




