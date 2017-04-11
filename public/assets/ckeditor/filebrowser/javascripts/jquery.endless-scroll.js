!function(e){"use strict";e.support.pushState=window.history&&window.history.pushState&&window.history.replaceState&&!navigator.userAgent.match(/((iPod|iPhone|iPad).+\bOS\s+[1-4]|WebApps\/.+CFNetwork)/);var t={init:function(t,a){a.options=e.extend({scrollContainer:window,scrollPadding:100,scrollEventDelay:300},t),this.options=a.options,this.container=a.container,a.scrollModule=this,this._toplock=!0,this._bottomlock=!0,this.scrollContainer=e(this.options.scrollContainer),this.updateEntities(),this.sortMarkers(),this.currentPage=null,this.container.on("jes:afterPageLoad",e.proxy(function(e,t,a){if(this.updateEntities(),this.sortMarkers(),this.checkMarker(),"top"==a){var i=this.markers[1].top,n=this.scrollContainer.scrollTop();this.scrollContainer.scrollTop(n+i)}},this)),this.bind()},updateEntities:function(){this.entities=e(this.options.entity,this.container)},sortMarkers:function(){var t=[];e(".jes-marker",this.container).each(function(){t.push({top:e(this).position().top,url:e(this).data("jesUrl")})}),this.markers=t},checkMarker:function(){for(var t=this.markers[0],a=this.scrollContainer.scrollTop(),i=1;i<this.markers.length&&a>this.markers[i].top;i++)t=this.markers[i];t.url!=this.currentPage&&(this.currentPage=t.url,e(this.container).trigger("jes:scrollToPage",t.url))},bind:function(){this.scrollContainer.on("scroll.jes",e.proxy(function(t){this._tId||(this.scrollHandler(t),this._tId=setTimeout(e.proxy(function(){this._tId=null},this),this.options.scrollEventDelay))},this))},unbind:function(){e(this.options.scrollContainer).off("scroll.jes")},scrollHandler:function(){var t=this.scrollContainer,a=this.entities,i=a.first(),n=a.last(),o=t.scrollTop(),l=t.height(),r=o+l,s=i.position().top,d=s+this.options.scrollPadding,c=n.outerHeight()+n.position().top,u=c-this.options.scrollPadding;o<d?this._toplock||(e(this.container).trigger("jes:topThreshold"),this._toplock=!0):this._toplock=!1,r>u?this._bottomlock||(e(this.container).trigger("jes:bottomThreshold"),this._bottomlock=!0):this._bottomlock=!1,this.checkMarker()}},a={init:function(t,a){a.options=e.extend({},t),this.options=a.options,this.container=a.container,this.setMarker(e(this.options.entity,this.container).first(),location.href),a.ajaxModule=this},loadPage:function(t,a,i){var n={top:{find:"first",inject:"insertBefore"},bottom:{find:"last",inject:"insertAfter"}},o=n[a];this.container.trigger("jes:beforePageLoad",[t,a]),e.get(t,null,e.proxy(function(n){var l=e("<div>").html(n),r=this.options.container,s=e(r,l).first();if(s.length){var d=s.find(this.options.entity);"bottom"==a&&d.each(function(){var t=e(this).attr("id");t&&e("#"+t,this.container).remove()});var c=e(this.options.entity,r)[o.find]();d[o.inject](c),this.setMarker(d.first(),t)}e.isFunction(i)&&i(l),this.container.trigger("jes:afterPageLoad",[t,a,l,d])},this),"html")},setMarker:function(e,t){e.addClass("jes-marker").data("jesUrl",t)}},i={init:function(t,a){a.options=e.extend({nextPage:".pagination a[rel=next]",previousPage:".pagination a[rel=previous]"},t),this.options=a.options,this.container=a.container,e.each([{selector:this.options.nextPage,event:"jes:bottomThreshold.navigation",placement:"bottom"},{selector:this.options.previousPage,event:"jes:topThreshold.navigation",placement:"top"}],e.proxy(function(t,i){if(i.element=e(i.selector),i.element.length){var n=i.element.prop("href"),o=!1,l=function(){!o&&n&&(o=!0,a.ajaxModule.loadPage(n,i.placement,e.proxy(function(t){var a=e(i.selector,e(t));a.length?(o=!1,n=a.prop("href"),i.element.attr("href",n)):(e(this).off(i.event),i.element.remove())},this)))};e(this.container).on(i.event,l),e(i.element).on("click",e.proxy(function(e){e.preventDefault(),l.apply(this.container)},this))}},this))}},n={init:function(t,a){e.support.pushState&&a.container.on("jes:scrollToPage",function(e,t){history.replaceState({},null,t)})}};e.endlessScroll=function(o){if(this.options=e.extend(!0,{container:"#container",entity:".entity",_modules:[a,t,i,n],modules:[]},o),this.container=e(this.options.container),!this.container.length)throw"Container for endless scroll isn't available on the page";return e.merge(this.options.modules,this.options._modules),this.options.modules.forEach(e.proxy(function(e){e.init(this.options,this)},this)),this}}(jQuery);