CKEDITOR.dialog.add("checkspell",function(e){function a(e,a){var n=0;return function(){"function"==typeof window.doSpell?("undefined"!=typeof i&&window.clearInterval(i),t(e)):180==n++&&window._cancelOnError(a)}}function t(a){var t=new window._SP_FCK_LangCompare,i=CKEDITOR.getUrl(e.plugins.wsc.path+"dialogs/"),n=i+"tmpFrameset.html";window.gFCKPluginName="wsc",t.setDefaulLangCode(e.config.defaultLanguage),window.doSpell({ctrl:o,lang:e.config.wsc_lang||t.getSPLangCode(e.langCode),intLang:e.config.wsc_uiLang||t.getSPLangCode(e.langCode),winType:l,onCancel:function(){a.hide()},onFinish:function(t){e.focus(),a.getParentEditor().setData(t.value),a.hide()},staticFrame:n,framesetPath:n,iframePath:i+"ciframe.html",schemaURI:i+"wsc.css",userDictionaryName:e.config.wsc_userDictionaryName,customDictionaryName:e.config.wsc_customDictionaryIds&&e.config.wsc_customDictionaryIds.split(","),domainName:e.config.wsc_domainName}),CKEDITOR.document.getById(r).setStyle("display","none"),CKEDITOR.document.getById(l).setStyle("display","block")}var i,n=CKEDITOR.tools.getNextNumber(),l="cke_frame_"+n,o="cke_data_"+n,r="cke_error_"+n,n=document.location.protocol||"http:",s=e.lang.wsc.notAvailable,d='<textarea style="display: none" id="'+o+'" rows="10" cols="40"> </textarea><div id="'+r+'" style="display:none;color:red;font-size:16px;font-weight:bold;padding-top:160px;text-align:center;z-index:11;"></div><iframe src="" style="width:100%;background-color:#f1f1e3;" frameborder="0" name="'+l+'" id="'+l+'" allowtransparency="1"></iframe>',c=e.config.wsc_customLoaderScript||n+"//loader.webspellchecker.net/sproxy_fck/sproxy.php?plugin=fck2&customerid="+e.config.wsc_customerId+"&cmd=script&doc=wsc&schema=22";return e.config.wsc_customLoaderScript&&(s+='<p style="color:#000;font-size:11px;font-weight: normal;text-align:center;padding-top:10px">'+e.lang.wsc.errorLoading.replace(/%s/g,e.config.wsc_customLoaderScript)+"</p>"),window._cancelOnError=function(a){if("undefined"==typeof window.WSC_Error){CKEDITOR.document.getById(l).setStyle("display","none");var t=CKEDITOR.document.getById(r);t.setStyle("display","block"),t.setHtml(a||e.lang.wsc.notAvailable)}},{title:e.config.wsc_dialogTitle||e.lang.wsc.title,minWidth:485,minHeight:380,buttons:[CKEDITOR.dialog.cancelButton],onShow:function(){var t=this.getContentElement("general","content").getElement();t.setHtml(d),t.getChild(2).setStyle("height",this._.contentSize.height+"px"),"function"!=typeof window.doSpell&&CKEDITOR.document.getHead().append(CKEDITOR.document.createElement("script",{attributes:{type:"text/javascript",src:c}})),t=e.getData(),CKEDITOR.document.getById(o).setValue(t),i=window.setInterval(a(this,s),250)},onHide:function(){window.ooo=void 0,window.int_framsetLoaded=void 0,window.framesetLoaded=void 0,window.is_window_opened=!1},contents:[{id:"general",label:e.config.wsc_dialogTitle||e.lang.wsc.title,padding:0,elements:[{type:"html",id:"content",html:""}]}]}}),CKEDITOR.dialog.on("resize",function(e){e=e.data;var a=e.dialog;"checkspell"==a._.name&&((a=(a=a.getContentElement("general","content").getElement())&&a.getChild(2))&&a.setSize("height",e.height),a&&a.setSize("width",e.width))});