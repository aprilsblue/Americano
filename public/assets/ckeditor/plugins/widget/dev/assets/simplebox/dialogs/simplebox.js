CKEDITOR.dialog.add("simplebox",function(e){return{title:"Edit Simple Box",minWidth:200,minHeight:100,contents:[{id:"info",elements:[{id:"align",type:"select",label:"Align",items:[[e.lang.common.notSet,""],[e.lang.common.alignLeft,"left"],[e.lang.common.alignRight,"right"],[e.lang.common.alignCenter,"center"]],setup:function(e){this.setValue(e.data.align)},commit:function(e){e.setData("align",this.getValue())}},{id:"width",type:"text",label:"Width",width:"50px",setup:function(e){this.setValue(e.data.width)},commit:function(e){e.setData("width",this.getValue())}}]}]}});