// 测试函数
function test () {
    console.log('this is a test')
}

// 计时器跳转
function timerTip (modalEl, msg, url, time) {
    $(modalEl + ' .modal-body h4').text(msg)
    $(modalEl).modal()
    var t = time | 5
    var timeout = time * 1000
    $(modalEl + ' .modal-footer button span').text(t)
    var timeTipInterval = setInterval(function () {
        t--
        $(modalEl + ' .modal-footer button span').text(t)
    }, 1000)
    setTimeout(function () {
        if (url) {
            location.href = url
        } else {
            $(modalEl).modal('hide')
        }
        clearInterval(timeTipInterval)
    }, timeout)
}