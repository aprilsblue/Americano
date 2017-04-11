!function(){function d(e,t){l.call(this,e,t),this.actualConfig=this.originalConfig=this.removedButtons=null,this.emptyVisible=!1,this.state="edit",this.toolbarButtons=[{text:{active:"Hide empty toolbar groups",inactive:"Show empty toolbar groups"},group:"edit",position:"left",cssClass:"button-a-soft",clickCallback:function(e,t){e[e.hasClass("button-a-background")?"removeClass":"addClass"]("button-a-background"),this._toggleVisibilityEmptyElements(),this.emptyVisible?e.setText(t.text.active):e.setText(t.text.inactive)}},{text:"Add row separator",group:"edit",position:"left",cssClass:"button-a-soft",clickCallback:function(){this._addSeparator()}},{text:"Select config",group:"config",position:"left",cssClass:"button-a-soft",clickCallback:function(){this.configContainer.findOne("textarea").$.select()}},{text:"Back to configurator",group:"config",position:"right",cssClass:"button-a-background",clickCallback:function(){if("paste"===this.state){var e=this.configContainer.findOne("textarea").getValue();(e=d.evaluateToolbarGroupsConfig(e))?this.setConfig(e):alert("Your pasted config is wrong.")}this.state="edit",this._showConfigurationTool(),this.showToolbarBtnsByGroupName(this.state)}},{text:'Get toolbar <span class="highlight">config</span>',group:"edit",position:"right",cssClass:"button-a-background icon-pos-left icon-download",clickCallback:function(){this.state="config",this._showConfig(),this.showToolbarBtnsByGroupName(this.state)}}],this.cachedActiveElement=null}var l=ToolbarConfigurator.AbstractToolbarModifier;return ToolbarConfigurator.ToolbarModifier=d,d.prototype=Object.create(ToolbarConfigurator.AbstractToolbarModifier.prototype),d.prototype.getActualConfig=function(){var e=l.prototype.getActualConfig.call(this);if(e.toolbarGroups)for(var t=e.toolbarGroups.length,a=0;a<t;a+=1)e.toolbarGroups[a]=d.parseGroupToConfigValue(e.toolbarGroups[a]);return e},d.prototype._onInit=function(e,t,a){a=!0===a,l.prototype._onInit.call(this,void 0,t),this.removedButtons=[],a?this.removedButtons=this.actualConfig.removeButtons?this.actualConfig.removeButtons.split(","):[]:"removeButtons"in this.originalConfig?this.removedButtons=this.originalConfig.removeButtons?this.originalConfig.removeButtons.split(","):[]:(this.originalConfig.removeButtons="",this.removedButtons=[]),this.actualConfig.toolbarGroups||(this.actualConfig.toolbarGroups=this.fullToolbarEditor.getFullToolbarGroupsConfig()),this._fixGroups(this.actualConfig),this._calculateTotalBtns(),this._createModifier(),this._refreshMoveBtnsAvalibility(),this._refreshBtnTabIndexes(),"function"==typeof e&&e(this.mainContainer)},d.prototype._showConfigurationTool=function(){this.configContainer.addClass("hidden"),this.modifyContainer.removeClass("hidden")},d.prototype._showConfig=function(){var e,t,a=this.getActualConfig();if(a.toolbarGroups){e=a.toolbarGroups;for(var i=this.cfg.trimEmptyGroups,n=[],o=e.length,r=0;r<o;r++){var s=e[r];if("/"===s)n.push("'/'");else{if(i)for(var c=s.groups.length;c--;)0===d.getTotalSubGroupButtonsNumber(s.groups[c],this.fullToolbarEditor)&&s.groups.splice(c,1);i&&0===s.groups.length||n.push(l.stringifyJSONintoOneLine(s,{addSpaces:!0,noQuotesOnKey:!0,singleQuotes:!0}))}}e="\n\t\t"+n.join(",\n\t\t")}a.removeButtons&&(t=a.removeButtons),a=['<textarea class="configCode" readonly>CKEDITOR.editorConfig = function( config ) {\n',e?"\tconfig.toolbarGroups = ["+e+"\n\t];":"",t?"\n\n":"",t?"\tconfig.removeButtons = '"+t+"';":"","\n};</textarea>"].join(""),this.modifyContainer.addClass("hidden"),this.configContainer.removeClass("hidden"),this.configContainer.setHtml(a)},d.prototype._toggleVisibilityEmptyElements=function(){this.modifyContainer.hasClass("empty-visible")?(this.modifyContainer.removeClass("empty-visible"),this.emptyVisible=!1):(this.modifyContainer.addClass("empty-visible"),this.emptyVisible=!0),this._refreshMoveBtnsAvalibility()},d.prototype._createModifier=function(){function e(){t._highlightGroup(this.data("name"))}var t=this;l.prototype._createModifier.call(this),this.modifyContainer.setHtml(this._toolbarConfigToListString());var a=this.modifyContainer.find('li[data-type="group"]');this.modifyContainer.on("mouseleave",function(){this._dehighlightActiveToolGroup()},this);for(var i=a.count(),n=0;n<i;n+=1)a.getItem(n).on("mouseenter",e);return CKEDITOR.document.on("keypress",function(e){e=e.data.$.keyCode,e=32===e||13===e;var a=new CKEDITOR.dom.element(CKEDITOR.document.$.activeElement);a.getAscendant(function(e){return e.$===t.mainContainer.$})&&e&&"button"===a.data("type")&&a.findOne("input").$.click()}),this.modifyContainer.on("click",function(e){var a=e.data.$,i=new CKEDITOR.dom.element(a.target||a.srcElement);if(e=d.getGroupOrSeparatorLiAncestor(i)){if(t.cachedActiveElement=document.activeElement,i.$ instanceof HTMLInputElement)t._handleCheckboxClicked(i);else if(i.$ instanceof HTMLButtonElement&&(a.preventDefault?a.preventDefault():a.returnValue=!1,(a=t._handleAnchorClicked(i.$))&&"remove"==a.action))return;a=e.data("type"),e=e.data("name"),t._setActiveElement(a,e),t.cachedActiveElement&&t.cachedActiveElement.focus()}}),this.toolbarContainer||(this._createToolbar(),this.toolbarContainer.insertBefore(this.mainContainer.getChildren().getItem(0))),this.showToolbarBtnsByGroupName("edit"),this.configContainer||(this.configContainer=new CKEDITOR.dom.element("div"),this.configContainer.addClass("configContainer"),this.configContainer.addClass("hidden"),this.mainContainer.append(this.configContainer)),this.mainContainer},d.prototype.showToolbarBtnsByGroupName=function(e){if(this.toolbarContainer)for(var t=this.toolbarContainer.find("button"),a=t.count(),i=0;i<a;i+=1){var n=t.getItem(i);n.data("group")==e?n.removeClass("hidden"):n.addClass("hidden")}},d.parseGroupToConfigValue=function(e){if("separator"==e.type)return"/";var t=e.groups,a=t.length;delete e.totalBtns;for(var i=0;i<a;i+=1)t[i]=t[i].name;return e},d.getGroupOrSeparatorLiAncestor=function(e){return e.$ instanceof HTMLLIElement&&"group"==e.data("type")?e:d.getFirstAncestor(e,function(e){return e=e.data("type"),"group"==e||"separator"==e})},d.prototype._setActiveElement=function(e,t){if(this.currentActive&&this.currentActive.elem.removeClass("active"),null===e)this._dehighlightActiveToolGroup(),this.currentActive=null;else{var a=this.mainContainer.findOne('ul[data-type=table-body] li[data-type="'+e+'"][data-name="'+t+'"]');a.addClass("active"),this.currentActive={type:e,name:t,elem:a},"group"==e&&this._highlightGroup(t),"separator"==e&&this._dehighlightActiveToolGroup()}},d.prototype.getActiveToolGroup=function(){return this.editorInstance.container?this.editorInstance.container.findOne(".cke_toolgroup.active, .cke_toolbar.active"):null},d.prototype._dehighlightActiveToolGroup=function(){var e=this.getActiveToolGroup();e&&e.removeClass("active"),this.editorInstance.container&&this.editorInstance.container.removeClass("some-toolbar-active")},d.prototype._highlightGroup=function(e){this.editorInstance.container&&(e=this.getFirstEnabledButtonInGroup(e),e=this.editorInstance.container.findOne(".cke_button__"+e+", .cke_combo__"+e),this._dehighlightActiveToolGroup(),this.editorInstance.container&&this.editorInstance.container.addClass("some-toolbar-active"),e&&(e=d.getFirstAncestor(e,function(e){return e.hasClass("cke_toolbar")}))&&e.addClass("active"))},d.prototype.getFirstEnabledButtonInGroup=function(e){var t=this.actualConfig.toolbarGroups;if(e=this.getGroupIndex(e),t=t[e],-1===e)return null;e=t.groups?t.groups.length:0;for(var a=0;a<e;a+=1){var i=this.getFirstEnabledButtonInSubgroup(t.groups[a].name);if(i)return i}return null},d.prototype.getFirstEnabledButtonInSubgroup=function(e){for(var t=(e=this.fullToolbarEditor.buttonsByGroup[e])?e.length:0,a=0;a<t;a+=1){var i=e[a].name;if(!this.isButtonRemoved(i))return i}return null},d.prototype._handleCheckboxClicked=function(e){var t=e.getAscendant("li").data("name");e.$.checked?this._removeButtonFromRemoved(t):this._addButtonToRemoved(t)},d.prototype._handleAnchorClicked=function(e){e=new CKEDITOR.dom.element(e);var t,a=e.getAscendant("li"),i=a.getAscendant("ul"),n=a.data("type"),l=a.data("name"),o=e.data("direction"),r="up"===o?a.getPrevious():a.getNext();if(e.hasClass("disabled"))return null;if(e.hasClass("remove"))return a.remove(),this._removeSeparator(a.data("name")),this._setActiveElement(null),{action:"remove"};if(!e.hasClass("move")||!r)return{action:null};"group"!==n&&"separator"!==n||(t=this._moveGroup(o,l)),"subgroup"===n&&(t=a.getAscendant("li").data("name"),t=this._moveSubgroup(o,t,l)),"up"===o&&a.insertBefore(i.getChild(t)),"down"===o&&a.insertAfter(i.getChild(t));for(var s;a="up"===o?a.getPrevious():a.getNext();)if(this.emptyVisible||!a.hasClass("empty")){s=a;break}return s||(s='[data-direction="'+("up"===o?"down":"up")+'"]',this.cachedActiveElement=e.getParent().findOne(s)),this._refreshMoveBtnsAvalibility(),this._refreshBtnTabIndexes(),{action:"move"}},d.prototype._refreshMoveBtnsAvalibility=function(){function e(e){var a=e.count();for(n=0;n<a;n+=1)t._disableElementsInList(e.getItem(n))}for(var t=this,a=this.mainContainer.find("ul[data-type=table-body] li > p > span > button.move.disabled"),i=a.count(),n=0;n<i;n+=1)a.getItem(n).removeClass("disabled");e(this.mainContainer.find("ul[data-type=table-body]")),e(this.mainContainer.find("ul[data-type=table-body] > li > ul"))},d.prototype._refreshBtnTabIndexes=function(){for(var e=this.mainContainer.find('[data-tab="true"]'),t=e.count(),a=0;a<t;a++){var i=e.getItem(a),n=i.hasClass("disabled");i.setAttribute("tabindex",n?-1:a)}},d.prototype._disableElementsInList=function(e){function t(e){return!e.hasClass("empty")}if(e.getChildren().count()){var a;if(this.emptyVisible?(a=e.getFirst(),e=e.getLast()):(a=e.getFirst(t),e=e.getLast(t)),a)var i=a.findOne('p button[data-direction="up"]');if(e)var n=e.findOne('p button[data-direction="down"]');i&&(i.addClass("disabled"),i.setAttribute("tabindex","-1")),n&&(n.addClass("disabled"),n.setAttribute("tabindex","-1"))}},d.prototype.getGroupIndex=function(e){for(var t=this.actualConfig.toolbarGroups,a=t.length,i=0;i<a;i+=1)if(t[i].name===e)return i;return-1},d.prototype._addSeparator=function(){var e=this._determineSeparatorToAddIndex(),t=d.createSeparatorLiteral(),a=CKEDITOR.dom.element.createFromHtml(d.getToolbarSeparatorString(t));this.actualConfig.toolbarGroups.splice(e,0,t),a.insertBefore(this.modifyContainer.findOne("ul[data-type=table-body]").getChild(e)),this._setActiveElement("separator",t.name),this._refreshMoveBtnsAvalibility(),this._refreshBtnTabIndexes(),this._refreshEditor()},d.prototype._removeSeparator=function(e){var t=CKEDITOR.tools.indexOf(this.actualConfig.toolbarGroups,function(t){return"separator"==t.type&&t.name==e});this.actualConfig.toolbarGroups.splice(t,1),this._refreshMoveBtnsAvalibility(),this._refreshBtnTabIndexes(),this._refreshEditor()},d.prototype._determineSeparatorToAddIndex=function(){return this.currentActive?("group"==this.currentActive.elem.data("type")||"separator"==this.currentActive.elem.data("type")?this.currentActive.elem:this.currentActive.elem.getAscendant("li")).getIndex():0},d.prototype._moveElement=function(e,t,a){function i(e){return e.totalBtns||"separator"==e.type}return a=this.emptyVisible?"down"==a?t+1:t-1:d.getFirstElementIndexWith(e,t,a,i),d.moveTo(a-t,e,t)},d.prototype._moveGroup=function(e,t){var a=this.getGroupIndex(t),a=this._moveElement(this.actualConfig.toolbarGroups,a,e);return this._refreshMoveBtnsAvalibility(),this._refreshBtnTabIndexes(),this._refreshEditor(),a},d.prototype._moveSubgroup=function(e,t,a){t=this.getGroupIndex(t),t=this.actualConfig.toolbarGroups[t];var i=CKEDITOR.tools.indexOf(t.groups,function(e){return e.name==a});return e=this._moveElement(t.groups,i,e),this._refreshEditor(),e},d.prototype._calculateTotalBtns=function(){for(var e=this.actualConfig.toolbarGroups,t=e.length;t--;){var a=e[t],i=d.getTotalGroupButtonsNumber(a,this.fullToolbarEditor);"separator"!=a.type&&(a.totalBtns=i)}},d.prototype._addButtonToRemoved=function(e){if(-1!=CKEDITOR.tools.indexOf(this.removedButtons,e))throw"Button already added to removed";this.removedButtons.push(e),this.actualConfig.removeButtons=this.removedButtons.join(","),this._refreshEditor()},d.prototype._removeButtonFromRemoved=function(e){if(e=CKEDITOR.tools.indexOf(this.removedButtons,e),-1===e)throw"Trying to remove button from removed, but not found";this.removedButtons.splice(e,1),this.actualConfig.removeButtons=this.removedButtons.join(","),this._refreshEditor()},d.parseGroupToConfigValue=function(e){if("separator"==e.type)return"/";var t=e.groups,a=t.length;delete e.totalBtns;for(var i=0;i<a;i+=1)t[i]=t[i].name;return e},d.getGroupOrSeparatorLiAncestor=function(e){return e.$ instanceof HTMLLIElement&&"group"==e.data("type")?e:d.getFirstAncestor(e,function(e){return e=e.data("type"),"group"==e||"separator"==e})},d.createSeparatorLiteral=function(){return{type:"separator",name:"separator"+CKEDITOR.tools.getNextNumber()}},d.prototype._toolbarConfigToListString=function(){for(var e=this.actualConfig.toolbarGroups||[],t='<ul data-type="table-body">',a=e.length,i=0;i<a;i+=1)var n=e[i],t="separator"===n.type?t+d.getToolbarSeparatorString(n):t+this._getToolbarGroupString(n);return t+="</ul>",d.getToolbarHeaderString()+t},d.prototype._getToolbarGroupString=function(e){var t,a=e.groups;t=""+['<li data-type="group" data-name="',e.name,'" ',e.totalBtns?"":'class="empty"',">"].join(""),t+=d.getToolbarElementPreString(e)+"<ul>",e=a.length;for(var i=0;i<e;i+=1){var n=a[i];t+=this._getToolbarSubgroupString(n,this.fullToolbarEditor.buttonsByGroup[n.name])}return t+"</ul></li>"},d.getToolbarSeparatorString=function(e){return['<li data-type="',e.type,'" data-name="',e.name,'">',d.getToolbarElementPreString("row separator"),"</li>"].join("")},d.getToolbarHeaderString=function(){return'<ul data-type="table-header"><li data-type="header"><p>Toolbars</p><ul><li><p>Toolbar groups</p><p>Toolbar group items</p></li></ul></li></ul>'},d.getFirstAncestor=function(e,t){for(var a=e.getParents(),i=a.length;i--;)if(t(a[i]))return a[i];return null},d.getFirstElementIndexWith=function(e,t,a,i){for(;"up"===a?t--:++t<e.length;)if(i(e[t]))return t;return-1},d.moveTo=function(e,t,a){var i;return-1!==a&&(i=t.splice(a,1)[0]),e=a+e,t.splice(e,0,i),e},d.getTotalSubGroupButtonsNumber=function(e,t){var a=t.buttonsByGroup["string"==typeof e?e:e.name];return a?a.length:0},d.getTotalGroupButtonsNumber=function(e,t){for(var a=0,i=e.groups,n=i?i.length:0,l=0;l<n;l+=1)a+=d.getTotalSubGroupButtonsNumber(i[l],t);return a},d.prototype._getToolbarSubgroupString=function(e,t){var a;a=""+['<li data-type="subgroup" data-name="',e.name,'" ',e.totalBtns?"":'class="empty" ',">"].join(""),a+=d.getToolbarElementPreString(e.name),a+="<ul>";for(var i=t?t.length:0,n=0;n<i;n+=1)a+=this.getButtonString(t[n]);return a+="</ul></li>"},d.prototype._getConfigButtonName=function(e){var t,a=this.fullToolbarEditor.editorInstance.ui.items;for(t in a)if(a[t].name==e)return t;return null},d.prototype.isButtonRemoved=function(e){return-1!=CKEDITOR.tools.indexOf(this.removedButtons,this._getConfigButtonName(e))},d.prototype.getButtonString=function(e){var t=this.isButtonRemoved(e.name)?"":'checked="checked"';return['<li data-tab="true" data-type="button" data-name="',this._getConfigButtonName(e.name),'"><label title="',e.label,'" ><input tabindex="-1"type="checkbox"',t,"/>",e.$.getOuterHtml(),"</label></li>"].join("")},d.getToolbarElementPreString=function(e){return e=e.name?e.name:e,['<p><span><button title="Move element upward" data-tab="true" data-direction="up" class="move icon-up-big"></button><button title="Move element downward" data-tab="true" data-direction="down" class="move icon-down-big"></button>',"row separator"==e?'<button title="Remove element" data-tab="true" class="remove icon-trash"></button>':"",e,"</span></p>"].join("")},d.evaluateToolbarGroupsConfig=function(a){return a=function(a){var c={},d;try{d=eval("("+a+")")}catch(f){try{d=eval(a)}catch(e){return null}}return c.toolbarGroups&&"number"==typeof c.toolbarGroups.length?JSON.stringify(c):d&&"number"==typeof d.length?JSON.stringify({toolbarGroups:d}):d&&d.toolbarGroups?JSON.stringify(d):null}(a)},d}();