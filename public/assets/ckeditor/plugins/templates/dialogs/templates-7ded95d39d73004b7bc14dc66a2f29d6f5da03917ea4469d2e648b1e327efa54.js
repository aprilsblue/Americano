!function(){CKEDITOR.dialog.add("templates",function(e){function a(e,a){var i=CKEDITOR.dom.element.createFromHtml('<a href="javascript:void(0)" tabIndex="-1" role="option" ><div class="cke_tpl_item"></div></a>'),l='<table style="width:350px;" class="cke_tpl_preview" role="presentation"><tr>';return e.image&&a&&(l+='<td class="cke_tpl_preview_img"><img src="'+CKEDITOR.getUrl(a+e.image)+'"'+(CKEDITOR.env.ie6Compat?' onload="this.width=this.width"':"")+' alt="" title=""></td>'),l+='<td style="white-space:normal;"><span class="cke_tpl_title">'+e.title+"</span><br/>",e.description&&(l+="<span>"+e.description+"</span>"),l+="</td></tr></table>",i.getFirst().setHtml(l),i.on("click",function(){t(e.html)}),i}function t(a){var t=CKEDITOR.dialog.getCurrent();t.getValueOf("selectTpl","chkInsertOpt")?(e.fire("saveSnapshot"),e.setData(a,function(){t.hide();var a=e.createRange();a.moveToElementEditStart(e.editable()),a.select(),setTimeout(function(){e.fire("saveSnapshot")},0)})):(e.insertHtml(a),t.hide())}function i(e){var a=e.data.getTarget(),t=n.equals(a);if(t||n.contains(a)){var i,l=e.data.getKeystroke(),o=n.getElementsByTag("a");if(o){if(t)i=o.getItem(0);else switch(l){case 40:i=a.getNext();break;case 38:i=a.getPrevious();break;case 13:case 32:a.fire("click")}i&&(i.focus(),e.data.preventDefault())}}}var l=CKEDITOR.plugins.get("templates");CKEDITOR.document.appendStyleSheet(CKEDITOR.getUrl(l.path+"dialogs/templates.css"));var n,l="cke_tpl_list_label_"+CKEDITOR.tools.getNextNumber(),o=e.lang.templates,r=e.config;return{title:e.lang.templates.title,minWidth:CKEDITOR.env.ie?440:400,minHeight:340,contents:[{id:"selectTpl",label:o.title,elements:[{type:"vbox",padding:5,children:[{id:"selectTplText",type:"html",html:"<span>"+o.selectPromptMsg+"</span>"},{id:"templatesList",type:"html",focus:!0,html:'<div class="cke_tpl_list" tabIndex="-1" role="listbox" aria-labelledby="'+l+'"><div class="cke_tpl_loading"><span></span></div></div><span class="cke_voice_label" id="'+l+'">'+o.options+"</span>"},{id:"chkInsertOpt",type:"checkbox",label:o.insertOption,"default":r.templates_replaceContent}]}]}],buttons:[CKEDITOR.dialog.cancelButton],onShow:function(){var e=this.getContentElement("selectTpl","templatesList");n=e.getElement(),CKEDITOR.loadTemplates(r.templates_files,function(){var t=(r.templates||"default").split(",");if(t.length){var i=n;i.setHtml("");for(var l=0,s=t.length;l<s;l++)for(var d=CKEDITOR.getTemplates(t[l]),c=d.imagesPath,d=d.templates,u=d.length,m=0;m<u;m++){var p=a(d[m],c);p.setAttribute("aria-posinset",m+1),p.setAttribute("aria-setsize",u),i.append(p)}e.focus()}else n.setHtml('<div class="cke_tpl_empty"><span>'+o.emptyListMsg+"</span></div>")}),this._.element.on("keydown",i)},onHide:function(){this._.element.removeListener("keydown",i)}}})}();