/**
 * @license Copyright (c) 2003-2017, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
  config.format_tags = 'p;h1;h2;h3;h4;h5;h6;pre;address;div';
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

  config.removeButtons = 'Source,Save,NewPage,Preview,Print,Templates,Cut,Undo,Redo,Copy,Paste,PasteText,PasteFromWord,Find,Replace,SelectAll,Scayt,Form,Checkbox,Radio,TextField,Textarea,Select,Button,ImageButton,HiddenField,CopyFormatting,RemoveFormat,NumberedList,Outdent,Indent,BulletedList,Blockquote,CreateDiv,JustifyCenter,JustifyLeft,BidiLtr,BidiRtl,JustifyRight,Language,JustifyBlock,Unlink,Anchor,Flash,HorizontalRule,Smiley,PageBreak,Iframe,Styles,Maximize,About,ShowBlocks,Font,FontSize';
};
