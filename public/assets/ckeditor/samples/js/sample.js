CKEDITOR.env.ie&&CKEDITOR.env.version<9&&CKEDITOR.tools.enableHtml5Elements(document),CKEDITOR.config.height=150,CKEDITOR.config.width="auto";var initSample=function(){function e(){return"%REV%"==CKEDITOR.revision||!!CKEDITOR.plugins.get("wysiwygarea")}var a=e(),t=!!CKEDITOR.plugins.get("bbcode");return function(){var e=CKEDITOR.document.getById("editor");t&&e.setHtml("Hello world!\n\nI'm an instance of [url=http://ckeditor.com]CKEditor[/url]."),a?CKEDITOR.replace("editor"):(e.setAttribute("contenteditable","true"),CKEDITOR.inline("editor"))}}();