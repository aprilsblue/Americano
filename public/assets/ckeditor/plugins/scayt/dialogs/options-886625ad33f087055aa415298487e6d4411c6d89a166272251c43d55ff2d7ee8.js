CKEDITOR.dialog.add("scaytDialog",function(e){var a=e.scayt,t='<p><img src="'+a.getLogo()+'" /></p><p>'+a.getLocal("version")+a.getVersion()+"</p><p>"+a.getLocal("text_copyrights")+"</p>",i=CKEDITOR.document,o={isChanged:function(){return null!==this.newLang&&this.currentLang!==this.newLang},currentLang:a.getLang(),newLang:null,reset:function(){this.currentLang=a.getLang(),this.newLang=null},id:"lang"},t=[{id:"options",label:a.getLocal("tab_options"),onShow:function(){},elements:[{type:"vbox",id:"scaytOptions",children:function(){var e,t=a.getApplicationConfig(),i=[],o={"ignore-all-caps-words":"label_allCaps","ignore-domain-names":"label_ignoreDomainNames","ignore-words-with-mixed-cases":"label_mixedCase","ignore-words-with-numbers":"label_mixedWithDigits"};for(e in t)t={type:"checkbox"},t.id=e,t.label=a.getLocal(o[e]),i.push(t);return i}(),onShow:function(){this.getChild();for(var a=e.scayt,t=0;t<this.getChild().length;t++)this.getChild()[t].setValue(a.getApplicationConfig()[this.getChild()[t].id])}}]},{id:"langs",label:a.getLocal("tab_languages"),elements:[{id:"leftLangColumn",type:"vbox",align:"left",widths:["100"],children:[{type:"html",id:"langBox",style:"overflow: hidden; white-space: normal;margin-bottom:15px;",html:'<div><div style="float:left;width:45%;margin-left:5px;" id="left-col-'+e.name+'" class="scayt-lang-list"></div><div style="float:left;width:45%;margin-left:15px;" id="right-col-'+e.name+'" class="scayt-lang-list"></div></div>',onShow:function(){var a=e.scayt.getLang();i.getById("scaytLang_"+e.name+"_"+a).$.checked=!0}},{type:"html",id:"graytLanguagesHint",html:'<div style="margin:5px auto; width:95%;white-space:normal;" id="'+e.name+'graytLanguagesHint"><span style="width:10px;height:10px;display: inline-block; background:#02b620;vertical-align:top;margin-top:2px;"></span> - This languages are supported by Grammar As You Type(GRAYT).</div>',onShow:function(){var a=i.getById(e.name+"graytLanguagesHint");e.config.grayt_autoStartup||(a.$.style.display="none")}}]}]},{id:"dictionaries",label:a.getLocal("tab_dictionaries"),elements:[{type:"vbox",id:"rightCol_col__left",children:[{type:"html",id:"dictionaryNote",html:""},{type:"text",id:"dictionaryName",label:a.getLocal("label_fieldNameDic")||"Dictionary name",onShow:function(a){var t=a.sender,i=e.scayt;setTimeout(function(){t.getContentElement("dictionaries","dictionaryNote").getElement().setText(""),null!=i.getUserDictionaryName()&&""!=i.getUserDictionaryName()&&t.getContentElement("dictionaries","dictionaryName").setValue(i.getUserDictionaryName())},0)}},{type:"hbox",id:"notExistDic",align:"left",style:"width:auto;",widths:["50%","50%"],children:[{type:"button",id:"createDic",label:a.getLocal("btn_createDic"),title:a.getLocal("btn_createDic"),onClick:function(){var a=this.getDialog(),t=n,i=e.scayt,o=a.getContentElement("dictionaries","dictionaryName").getValue();i.createUserDictionary(o,function(i){i.error||t.toggleDictionaryButtons.call(a,!0),i.dialog=a,i.command="create",i.name=o,e.fire("scaytUserDictionaryAction",i)},function(t){t.dialog=a,t.command="create",t.name=o,e.fire("scaytUserDictionaryActionError",t)})}},{type:"button",id:"restoreDic",label:a.getLocal("btn_restoreDic"),title:a.getLocal("btn_restoreDic"),onClick:function(){var a=this.getDialog(),t=e.scayt,i=n,o=a.getContentElement("dictionaries","dictionaryName").getValue();t.restoreUserDictionary(o,function(t){t.dialog=a,t.error||i.toggleDictionaryButtons.call(a,!0),t.command="restore",t.name=o,e.fire("scaytUserDictionaryAction",t)},function(t){t.dialog=a,t.command="restore",t.name=o,e.fire("scaytUserDictionaryActionError",t)})}}]},{type:"hbox",id:"existDic",align:"left",style:"width:auto;",widths:["50%","50%"],children:[{type:"button",id:"removeDic",label:a.getLocal("btn_deleteDic"),title:a.getLocal("btn_deleteDic"),onClick:function(){var a=this.getDialog(),t=e.scayt,i=n,o=a.getContentElement("dictionaries","dictionaryName"),l=o.getValue();t.removeUserDictionary(l,function(t){o.setValue(""),t.error||i.toggleDictionaryButtons.call(a,!1),t.dialog=a,t.command="remove",t.name=l,e.fire("scaytUserDictionaryAction",t)},function(t){t.dialog=a,t.command="remove",t.name=l,e.fire("scaytUserDictionaryActionError",t)})}},{type:"button",id:"renameDic",label:a.getLocal("btn_renameDic"),title:a.getLocal("btn_renameDic"),onClick:function(){var a=this.getDialog(),t=e.scayt,i=a.getContentElement("dictionaries","dictionaryName").getValue();t.renameUserDictionary(i,function(t){t.dialog=a,t.command="rename",t.name=i,e.fire("scaytUserDictionaryAction",t)},function(t){t.dialog=a,t.command="rename",t.name=i,e.fire("scaytUserDictionaryActionError",t)})}}]},{type:"html",id:"dicInfo",html:'<div id="dic_info_editor1" style="margin:5px auto; width:95%;white-space:normal;">'+a.getLocal("text_descriptionDic")+"</div>"}]}]},{id:"about",label:a.getLocal("tab_about"),elements:[{type:"html",id:"about",style:"margin: 5px 5px;",html:'<div><div id="scayt_about_">'+t+"</div></div>"}]}];e.on("scaytUserDictionaryAction",function(e){var a,t=SCAYT.prototype.UILib,i=e.data.dialog,o=i.getContentElement("dictionaries","dictionaryNote").getElement(),n=e.editor.scayt;void 0===e.data.error?(a=n.getLocal("message_success_"+e.data.command+"Dic"),a=a.replace("%s",e.data.name),o.setText(a),t.css(o.$,{color:"blue"})):(""===e.data.name?o.setText(n.getLocal("message_info_emptyDic")):(a=n.getLocal("message_error_"+e.data.command+"Dic"),a=a.replace("%s",e.data.name),o.setText(a)),t.css(o.$,{color:"red"}),null!=n.getUserDictionaryName()&&""!=n.getUserDictionaryName()?i.getContentElement("dictionaries","dictionaryName").setValue(n.getUserDictionaryName()):i.getContentElement("dictionaries","dictionaryName").setValue(""))}),e.on("scaytUserDictionaryActionError",function(e){var a,t=SCAYT.prototype.UILib,i=e.data.dialog,o=i.getContentElement("dictionaries","dictionaryNote").getElement(),n=e.editor.scayt;""===e.data.name?o.setText(n.getLocal("message_info_emptyDic")):(a=n.getLocal("message_error_"+e.data.command+"Dic"),a=a.replace("%s",e.data.name),o.setText(a)),t.css(o.$,{color:"red"}),null!=n.getUserDictionaryName()&&""!=n.getUserDictionaryName()?i.getContentElement("dictionaries","dictionaryName").setValue(n.getUserDictionaryName()):i.getContentElement("dictionaries","dictionaryName").setValue("")});var n={title:a.getLocal("text_title"),resizable:CKEDITOR.DIALOG_RESIZE_BOTH,minWidth:"moono-lisa"==(CKEDITOR.skinName||e.config.skin)?450:340,minHeight:260,onLoad:function(){if(0!=e.config.scayt_uiTabs[1]){var a=n,t=a.getLangBoxes.call(this);t.getParent().setStyle("white-space","normal"),a.renderLangList(t),this.definition.minWidth=this.getSize().width,this.resize(this.definition.minWidth,this.definition.minHeight)}},onCancel:function(){o.reset()},onHide:function(){e.unlockSelection()},onShow:function(){if(e.fire("scaytDialogShown",this),0!=e.config.scayt_uiTabs[2]){var a=e.scayt,t=this.getContentElement("dictionaries","dictionaryName"),i=this.getContentElement("dictionaries","existDic").getElement().getParent(),o=this.getContentElement("dictionaries","notExistDic").getElement().getParent();i.hide(),o.hide(),null!=a.getUserDictionaryName()&&""!=a.getUserDictionaryName()?(this.getContentElement("dictionaries","dictionaryName").setValue(a.getUserDictionaryName()),i.show()):(t.setValue(""),o.show())}},onOk:function(){var a=n,t=e.scayt;this.getContentElement("options","scaytOptions"),a=a.getChangedOption.call(this),t.commitOption({changedOptions:a})},toggleDictionaryButtons:function(e){var a=this.getContentElement("dictionaries","existDic").getElement().getParent(),t=this.getContentElement("dictionaries","notExistDic").getElement().getParent();e?(a.show(),t.hide()):(a.hide(),t.show())},getChangedOption:function(){var a={};if(1==e.config.scayt_uiTabs[0])for(var t=this.getContentElement("options","scaytOptions").getChild(),i=0;i<t.length;i++)t[i].isChanged()&&(a[t[i].id]=t[i].getValue());return o.isChanged()&&(a[o.id]=e.config.scayt_sLang=o.currentLang=o.newLang),a},buildRadioInputs:function(a,t,i){var n=new CKEDITOR.dom.element("div"),l="scaytLang_"+e.name+"_"+t,r=CKEDITOR.dom.element.createFromHtml('<input id="'+l+'" type="radio"  value="'+t+'" name="scayt_lang" />'),s=new CKEDITOR.dom.element("label"),d=e.scayt;return n.setStyles({"white-space":"normal",position:"relative","padding-bottom":"2px"}),r.on("click",function(e){o.newLang=e.sender.getValue()}),s.appendText(a),s.setAttribute("for",l),i&&e.config.grayt_autoStartup&&s.setStyles({color:"#02b620"}),n.append(r),n.append(s),t===d.getLang()&&(r.setAttribute("checked",!0),r.setAttribute("defaultChecked","defaultChecked")),n},renderLangList:function(t){var i=t.find("#left-col-"+e.name).getItem(0);t=t.find("#right-col-"+e.name).getItem(0);var o,n=a.getScaytLangList(),l=a.getGraytLangList(),r={},s=[],d=0,u=!1;for(o in n.ltr)r[o]=n.ltr[o];for(o in n.rtl)r[o]=n.rtl[o];for(o in r)s.push([o,r[o]]);for(s.sort(function(e,a){var t=0;return e[1]>a[1]?t=1:e[1]<a[1]&&(t=-1),t}),r={},u=0;u<s.length;u++)r[s[u][0]]=s[u][1];s=Math.round(s.length/2);for(o in r)d++,u=o in l.ltr||o in l.rtl,this.buildRadioInputs(r[o],o,u).appendTo(d<=s?i:t)},getLangBoxes:function(){return this.getContentElement("langs","langBox").getElement()},contents:function(e,a){var t=[],i=a.config.scayt_uiTabs;if(!i)return e;for(var o in i)1==i[o]&&t.push(e[o]);return t.push(e[e.length-1]),t}(t,e)};return n});