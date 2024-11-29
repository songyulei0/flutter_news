/*
    本JS 主要是监听菲龙网的详情页的一些按钮 的交互

    所有的按钮 都是btAction的监听。 然后通过传入不同的massess来进行区分
*/



// 监听元素出现以后再执行业务JS
function waitForElement(selector, callback) {
    const observer = new MutationObserver((mutations) => {
        const element = document.querySelector(selector);
        if (element) {
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
waitForElement('#follow_action', (element) => {
    console.log('follow_action 按钮已经出现,等待3秒再执行', element);
    setTimeout(function (){
        followActionBtn();
    },3000)
});



const followActionBtn = ()=>{
    // 加载关注按钮
    document.getElementById('follow_action').addEventListener('click',function(){
        window.btAction.postMessage('follow_action_btn');
        document.getElementById("advertises-top").style.display= "none";
        document.getElementsByClassName("explain")[0].style.display= "none";
        document.getElementById("reward").style.display= "none";
        let elements = document.getElementsByClassName("swiper-ad");
        for (let i = 0; i < elements.length; i++) {
            elements[i].style.display = "none";
        }

        replaceText("菲龙网管理员","菲菲飞管理员");
        replaceText("菲龙网","菲菲飞");
    });


    function replaceText(searchText, replaceText) {
        // 获取所有的文本节点
        const body = document.body;
        const walker = document.createTreeWalker(body, NodeFilter.SHOW_TEXT, null, false);
        let node;

        while (node = walker.nextNode()) {
            if (node.nodeValue.includes(searchText)) {
                // 替换文本
                node.nodeValue = node.nodeValue.replace(new RegExp(searchText, 'g'), replaceText);
            }
        }
    }

}




