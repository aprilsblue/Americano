CKEDITOR.dialog.add("button",function(e){function a(e){var a=this.getValue();a?(e.attributes[this.id]=a,"name"==this.id&&(e.attributes["data-cke-saved-name"]=a)):(delete e.attributes[this.id],"name"==this.id&&delete e.attributes["data-cke-saved-name"])}return{title:e.lang.forms.button.title,minWidth:350,minHeight:150,onShow:function(){delete this.button;var e=this.getParentEditor().getSelection().getSelectedElement();e&&e.is("input")&&e.getAttribute("type")in{button:1,reset:1,submit:1}&&(this.button=e,this.setupContent(e))},onOk:function(){var e=this.getParentEditor(),a=this.button,t=!a,i=a?CKEDITOR.htmlParser.fragment.fromHtml(a.getOuterHtml()).children[0]:new CKEDITOR.htmlParser.element("input");this.commitContent(i);var o=new CKEDITOR.htmlParser.basicWriter;i.writeHtml(o),i=CKEDITOR.dom.element.createFromHtml(o.getHtml(),e.document),t?e.insertElement(i):(i.replace(a),e.getSelection().selectElement(i))},contents:[{id:"info",label:e.lang.forms.button.title,title:e.lang.forms.button.title,elements:[{id:"name",type:"text",bidi:!0,label:e.lang.common.name,"default":"",setup:function(e){this.setValue(e.data("cke-saved-name")||e.getAttribute("name")||"")},commit:a},{id:"value",type:"text",label:e.lang.forms.button.text,accessKey:"V","default":"",setup:function(e){this.setValue(e.getAttribute("value")||"")},commit:a},{id:"type",type:"select",label:e.lang.forms.button.type,"default":"button",accessKey:"T",items:[[e.lang.forms.button.typeBtn,"button"],[e.lang.forms.button.typeSbm,"submit"],[e.lang.forms.button.typeRst,"reset"]],setup:function(e){this.setValue(e.getAttribute("type")||"")},commit:a}]}]}});