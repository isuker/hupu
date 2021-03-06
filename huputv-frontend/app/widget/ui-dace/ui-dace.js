/**
 * @file 封装dace接口
 * @author yuhongfei@hupu.com
 **/
var _queue = [];
var maxCache = 20;

module.exports = {
    init: function () {
        this.listenElement();
        this.listenDace();
    },
	/**
	 * 监听元素点击的事件. 在标签上添加 dace-node 属性，点击行为被自动收集.
	 * @example
	 *    <div dace-node="example">example</div>
	 **/
    listenElement: function () {
        var hasTouch = 'ontouchstart' in window;
        var nodeName = 'dace-node';
        var send = this.send;

        $('body').on(hasTouch ? 'click' : 'mousedown', function (e) {
            var target = e.target;
            while (!target.getAttribute(nodeName) && 'BODY' !== target.tagName) {
                target = target.parentElement;
                if (!target) {
                    break;
                }
            }
            if (target && 'BODY"' !== target.tagName) {
                var daceData = target.getAttribute(nodeName);
                send(daceData);
            }
        });
    },
	/**
	 * 监听dace是否ready
	 **/
    listenDace: function () {
        var self = this;
        this.interval = setInterval(function () {
            if (window.__dace && window.__dace.sendEvent) {
                clearInterval(self.interval);
                if (_queue && _queue.length) {
                    self.send();
                }
            }
        }, 5000);
    },
    /**
	 * 做个简单的队列，避免丢失统计数据.
	 *
	 * @param {string} daceStr dace的数据
	 * @return {void}
	 */
     send: function ( daceStr ) {
		if(window.__dace){
			var sendHandler = window.__dace.sendEvent;
			if(daceStr && daceStr.length) sendHandler(daceStr);
			if(_queue && _queue.length){
				_.each(_queue, function(item){
					sendHandler(item);
				});
				_queue = [];
			}
		} else{
			if(daceStr && daceStr.length) {
				if(_queue.length >= maxCache){
					_queue.shift();
				}
				_queue.push(daceStr);
			}
		}
	}
}
