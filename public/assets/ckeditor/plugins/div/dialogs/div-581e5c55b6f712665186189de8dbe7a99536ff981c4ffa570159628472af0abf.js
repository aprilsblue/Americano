!function(){function e(e,a,t){a.is&&a.getCustomData("block_processed")||(a.is&&CKEDITOR.dom.element.setMarker(t,a,"block_processed",!0),e.push(a))}function a(a,t){function i(){this.foreach(function(e){/^(?!vbox|hbox)/.test(e.type)&&(e.setup||(e.setup=function(a){e.setValue(a.getAttribute(e.id)||"",1)}),e.commit||(e.commit=function(a){var t=this.getValue();"dir"==e.id&&a.getComputedStyle("direction")==t||(t?a.setAttribute(e.id,t):a.removeAttribute(e.id))}))})}var o=function(){var e=CKEDITOR.tools.extend({},CKEDITOR.dtd.$blockLimit);return a.config.div_wrapTable&&(delete e.td,delete e.th),e}(),n=CKEDITOR.dtd.div,l={},r=[];return{title:a.lang.div.title,minWidth:400,minHeight:165,contents:[{id:"info",label:a.lang.common.generalTab,title:a.lang.common.generalTab,elements:[{type:"hbox",widths:["50%","50%"],children:[{id:"elementStyle",type:"select",style:"width: 100%;",label:a.lang.div.styleSelectLabel,"default":"",items:[[a.lang.common.notSet,""]],onChange:function(){var e=["info:elementStyle","info:class","advanced:dir","advanced:style"],t=this.getDialog(),i=t._element&&t._element.clone()||new CKEDITOR.dom.element("div",a.document);this.commit(i,!0);for(var o,e=[].concat(e),n=e.length,l=0;l<n;l++)(o=t.getContentElement.apply(t,e[l].split(":")))&&o.setup&&o.setup(i,!0)},setup:function(e){for(var t in l)l[t].checkElementRemovable(e,!0,a)&&this.setValue(t,1)},commit:function(e){var t;(t=this.getValue())?l[t].applyToObject(e,a):e.removeAttribute("style")}},{id:"class",type:"text",requiredContent:"div(cke-xyz)",label:a.lang.common.cssClass,"default":""}]}]},{id:"advanced",label:a.lang.common.advancedTab,title:a.lang.common.advancedTab,elements:[{type:"vbox",padding:1,children:[{type:"hbox",widths:["50%","50%"],children:[{type:"text",id:"id",requiredContent:"div[id]",label:a.lang.common.id,"default":""},{type:"text",id:"lang",requiredContent:"div[lang]",label:a.lang.common.langCode,"default":""}]},{type:"hbox",children:[{type:"text",id:"style",requiredContent:"div{cke-xyz}",style:"width: 100%;",label:a.lang.common.cssStyle,"default":"",commit:function(e){e.setAttribute("style",this.getValue())}}]},{type:"hbox",children:[{type:"text",id:"title",requiredContent:"div[title]",style:"width: 100%;",label:a.lang.common.advisoryTitle,"default":""}]},{type:"select",id:"dir",requiredContent:"div[dir]",style:"width: 100%;",label:a.lang.common.langDir,"default":"",items:[[a.lang.common.notSet,""],[a.lang.common.langDirLtr,"ltr"],[a.lang.common.langDirRtl,"rtl"]]}]}]}],onLoad:function(){i.call(this);var e=this,t=this.getContentElement("info","elementStyle");a.getStylesSet(function(i){var o,n;if(i)for(var r=0;r<i.length;r++)n=i[r],n.element&&"div"==n.element&&(o=n.name,l[o]=n=new CKEDITOR.style(n),a.filter.check(n)&&(t.items.push([o,o]),t.add(o,o)));t[1<t.items.length?"enable":"disable"](),setTimeout(function(){e._element&&t.setup(e._element)},0)})},onShow:function(){"editdiv"==t&&this.setupContent(this._element=CKEDITOR.plugins.div.getSurroundDiv(a))},onOk:function(){if("editdiv"==t)r=[this._element];else{var i,l,s,d=[],u={},p=[],c=a.getSelection(),m=c.getRanges(),g=c.createBookmarks();for(l=0;l<m.length;l++)for(s=m[l].createIterator();i=s.getNextParagraph();)if(i.getName()in o&&!i.isReadOnly()){var b=i.getChildren();for(i=0;i<b.count();i++)e(p,b.getItem(i),u)}else{for(;!n[i.getName()]&&!i.equals(m[l].root);)i=i.getParent();e(p,i,u)}for(CKEDITOR.dom.element.clearAllMarkers(u),m=[],l=null,s=0;s<p.length;s++)i=p[s],b=a.elementPath(i).blockLimit,b.isReadOnly()&&(b=b.getParent()),a.config.div_wrapTable&&b.is(["td","th"])&&(b=a.elementPath(b.getParent()).blockLimit),b.equals(l)||(l=b,m.push([])),m[m.length-1].push(i);for(l=0;l<m.length;l++){for(b=m[l][0],p=b.getParent(),i=1;i<m[l].length;i++)p=p.getCommonAncestor(m[l][i]);for(s=new CKEDITOR.dom.element("div",a.document),i=0;i<m[l].length;i++){for(b=m[l][i];!b.getParent().equals(p);)b=b.getParent();m[l][i]=b}for(i=0;i<m[l].length;i++)b=m[l][i],b.getCustomData&&b.getCustomData("block_processed")||(b.is&&CKEDITOR.dom.element.setMarker(u,b,"block_processed",!0),i||s.insertBefore(b),s.append(b));CKEDITOR.dom.element.clearAllMarkers(u),d.push(s)}c.selectBookmarks(g),r=d}for(d=r.length,u=0;u<d;u++)this.commitContent(r[u]),!r[u].getAttribute("style")&&r[u].removeAttribute("style");this.hide()},onHide:function(){"editdiv"==t&&this._element.removeCustomData("elementStyle"),delete this._element}}}CKEDITOR.dialog.add("creatediv",function(e){return a(e,"creatediv")}),CKEDITOR.dialog.add("editdiv",function(e){return a(e,"editdiv")})}();