"use strict";!function(){CKEDITOR.dialog.add("codeSnippet",function(e){var a,t=e._.codesnippet.langs,i=e.lang.codesnippet,o=document.documentElement.clientHeight,l=[];l.push([e.lang.common.notSet,""]);for(a in t)l.push([t[a],a]);var n=CKEDITOR.document.getWindow().getViewPaneSize(),r=Math.min(n.width-70,800),s=n.height/1.5;return o<650&&(s=o-220),{title:i.title,minHeight:200,resizable:CKEDITOR.DIALOG_RESIZE_NONE,contents:[{id:"info",elements:[{id:"lang",type:"select",label:i.language,items:l,setup:function(e){e.ready&&e.data.lang&&this.setValue(e.data.lang),!CKEDITOR.env.gecko||e.data.lang&&e.ready||(this.getInputElement().$.selectedIndex=-1)},commit:function(e){e.setData("lang",this.getValue())}},{id:"code",type:"textarea",label:i.codeContents,setup:function(e){this.setValue(e.data.code)},commit:function(e){e.setData("code",this.getValue())},required:!0,validate:CKEDITOR.dialog.validate.notEmpty(i.emptySnippetError),inputStyle:"cursor:auto;width:"+r+"px;height:"+s+"px;tab-size:4;text-align:left;","class":"cke_source"}]}]}})}();