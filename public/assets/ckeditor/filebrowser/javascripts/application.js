$.QueryString=function(e){if(""==e)return{};for(var t={},n=0;n<e.length;++n){var i=e[n].split("=");2==i.length&&(t[i[0]]=decodeURIComponent(i[1].replace(/\+/g," ")))}return t}(window.location.search.substr(1).split("&")),$(document).ready(function(){var e="div.gal-item div.gal-inner-holder";$(document).on("mouseover",e,function(){$(this).addClass("hover")}).on("mouseout",e,function(){$(this).removeClass("hover")}).on("click",e,function(){var e=$(this).parents("div.gal-item").data("url");CKEDITOR.tools.callFunction(CKEditorFuncNum,e),window.close()}),$(document).on("ajax:complete","div.gal-item a.gal-del",function(){$(this).parents("div.gal-item").remove()});var t=$.endlessScroll({container:".fileupload-list",entity:".gal-item",scrollPadding:100});t.scrollModule.unbind(),window.setTimeout(function(){t.scrollModule.bind()},1e3)}),qq.FileUploader.instances=new Object,qq.FileUploaderInput=function(e){qq.FileUploaderBasic.apply(this,arguments),qq.extend(this._options,{element:null,listElement:null,template_id:"#fileupload_tmpl",classes:{button:"fileupload-button",drop:"fileupload-drop-area",dropActive:"fileupload-drop-area-active",list:"fileupload-list",preview:"fileupload-preview",file:"fileupload-file",spinner:"fileupload-spinner",size:"fileupload-size",cancel:"fileupload-cancel",success:"fileupload-success",fail:"fileupload-fail"}}),qq.extend(this._options,e),this._element=document.getElementById(this._options.element),this._listElement=this._options.listElement||this._find(this._element,"list"),this._classes=this._options.classes,this._button=this._createUploadButton(this._find(this._element,"button")),qq.FileUploader.instances[this._element.id]=this},qq.extend(qq.FileUploaderInput.prototype,qq.FileUploaderBasic.prototype),qq.extend(qq.FileUploaderInput.prototype,{_find:function(e,t){var n=qq.getByClass(e,this._options.classes[t])[0];if(!n)throw alert(t),new Error("element not found "+t);return n},_setupDragDrop:function(){var e=this,t=this._find(this._element,"drop"),n=new qq.UploadDropZone({element:t,onEnter:function(n){qq.addClass(t,e._classes.dropActive),n.stopPropagation()},onLeave:function(e){e.stopPropagation()},onLeaveNotDescendants:function(){qq.removeClass(t,e._classes.dropActive)},onDrop:function(n){t.style.display="none",qq.removeClass(t,e._classes.dropActive),e._uploadFileList(n.dataTransfer.files)}});t.style.display="none",qq.attach(document,"dragenter",function(e){n._isValidFileDrag(e)&&(t.style.display="block")}),qq.attach(document,"dragleave",function(e){if(n._isValidFileDrag(e)){var i=document.elementFromPoint(e.clientX,e.clientY);i&&"HTML"!=i.nodeName||(t.style.display="none")}})},_onSubmit:function(e,t){qq.FileUploaderBasic.prototype._onSubmit.apply(this,arguments),this._addToList(e,t)},_onProgress:function(e,t,n,i){qq.FileUploaderBasic.prototype._onProgress.apply(this,arguments);var o,a=this._getItemByFileId(e),r=this._find(a,"size");o=n!=i?Math.round(n/i*100)+"% from "+this._formatSize(i):this._formatSize(i),qq.setText(r,o)},_onComplete:function(e,t,n){qq.FileUploaderBasic.prototype._onComplete.apply(this,arguments);var i=this._getItemByFileId(e),o=n.asset?n.asset:n;o&&o.id?(qq.addClass(i,this._classes.success),o.size=this._formatSize(o.size),o.controller=void 0!==o.type&&"ckeditor::picture"==o.type.toLowerCase()?"pictures":"attachment_files",$(i).replaceWith($(this._options.template_id).tmpl(o))):qq.addClass(i,this._classes.fail)},_addToList:function(e,t){if(this._listElement){this._options.multiple===!1&&$(this._listElement).empty();var n={id:0,filename:this._formatFileName(t),size:0,format_created_at:"",url_content:"#",controller:"assets",url_thumb:""},i=$(this._options.template_id).tmpl(n).attr("qqfileid",e);i.find("div.img").html("").addClass("preloader"),i.prependTo(this._listElement),this._bindCancelEvent(i)}},_getItemByFileId:function(e){return $(this._listElement).find("div[qqfileid="+e+"]").get(0)},_bindCancelEvent:function(e){var t=this,n=$(e);n.find("a."+this._classes.cancel).bind("click",function(e){return t._handler.cancel(n.attr("qqfileid")),n.remove(),qq.preventDefault(e),!1})}});