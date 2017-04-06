/**
 * @license Copyright (c) 2003-2017, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
  config.extraPlugins = 'codesnippet', 'codesnippetgeshi';
  config.codeSnippet_theme = 'monokai_sublime';
  config.toolbarGroups = [
    { name: 'document', groups: [ 'mode', 'document', 'doctools', 'codesnippet'  ] },
    { name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
    { name: 'editing', groups: [ 'find', 'selection', 'spellchecker', 'editing' ] },
    { name: 'forms', groups: [ 'forms' ] },
    { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
    { name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi', 'paragraph' ] },
    { name: 'links', groups: [ 'links' ] },
    { name: 'insert', groups: [ 'insert' ] },
    { name: 'styles', groups: [ 'styles' ] },
    { name: 'colors', groups: [ 'colors' ] },
    { name: 'tools', groups: [ 'tools' ] },
    { name: 'others', groups: [ 'others' ] },
    { name: 'about', groups: [ 'about' ] }
  ];

  config.removeButtons = 'Source,Save,Templates,NewPage,Preview,Print,Cut,Undo,Redo,Copy,Paste,PasteText,PasteFromWord,SelectAll,Find,Replace,Scayt,Form,Checkbox,Radio,TextField,Textarea,Select,Button,ImageButton,HiddenField,CopyFormatting,RemoveFormat,NumberedList,BulletedList,Outdent,Indent,Blockquote,CreateDiv,Flash,HorizontalRule,PageBreak,Iframe,Anchor,Language,BidiRtl,BidiLtr,Maximize,About,ShowBlocks,Styles,Format,JustifyLeft,JustifyCenter,JustifyRight,JustifyBlock,Underline,Strike,Unlink,Link,Font,Smiley';
};
