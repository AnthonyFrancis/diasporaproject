!function(){function t(e){for(var t,l=0,n=0,i=0,a=e.$.rows.length;i<a;i++){for(var o=l=0,s=(t=e.$.rows[i]).cells.length;o<s;o++)l+=t.cells[o].colSpan;n<l&&(n=l)}return n}function l(t){return function(){var e=this.getValue();return(e=!!(CKEDITOR.dialog.validate.integer()(e)&&0<e))||(alert(t),this.select()),e}}function n(g,s){var h=function(e){return new CKEDITOR.dom.element(e,g.document)},e=g.editable(),m=g.plugins.dialogadvtab;return{title:g.lang.table.title,minWidth:310,minHeight:CKEDITOR.env.ie?310:280,onLoad:function(){var l=this,e=l.getContentElement("advanced","advStyles");e&&e.on("change",function(){var e=this.getStyle("width",""),t=l.getContentElement("info","txtWidth");t&&t.setValue(e,!0),e=this.getStyle("height",""),(t=l.getContentElement("info","txtHeight"))&&t.setValue(e,!0)})},onShow:function(){var e,t=g.getSelection(),l=t.getRanges(),n=this.getContentElement("info","txtRows"),i=this.getContentElement("info","txtCols"),a=this.getContentElement("info","txtWidth"),o=this.getContentElement("info","txtHeight");"tableProperties"==s&&((t=t.getSelectedElement())&&t.is("table")?e=t:0<l.length&&(CKEDITOR.env.webkit&&l[0].shrink(CKEDITOR.NODE_ELEMENT),e=g.elementPath(l[0].getCommonAncestor(!0)).contains("table",1)),this._.selectedElement=e),e?(this.setupContent(e),n&&n.disable(),i&&i.disable()):(n&&n.enable(),i&&i.enable()),a&&a.onChange(),o&&o.onChange()},onOk:function(){var e=g.getSelection(),t=this._.selectedElement&&e.createBookmarks(),l=this._.selectedElement||h("table"),n={};if(this.commitContent(n,l),n.info){if(n=n.info,!this._.selectedElement)for(var i=l.append(h("tbody")),a=parseInt(n.txtRows,10)||0,o=parseInt(n.txtCols,10)||0,s=0;s<a;s++)for(var r=i.append(h("tr")),d=0;d<o;d++)r.append(h("td")).appendBogus();if(a=n.selHeaders,!l.$.tHead&&("row"==a||"both"==a)){for(r=new CKEDITOR.dom.element(l.$.createTHead()),i=(i=l.getElementsByTag("tbody").getItem(0)).getElementsByTag("tr").getItem(0),s=0;s<i.getChildCount();s++)(o=i.getChild(s)).type==CKEDITOR.NODE_ELEMENT&&!o.data("cke-bookmark")&&(o.renameNode("th"),o.setAttribute("scope","col"));r.append(i.remove())}if(null!==l.$.tHead&&"row"!=a&&"both"!=a){for(r=new CKEDITOR.dom.element(l.$.tHead),d=(i=l.getElementsByTag("tbody").getItem(0)).getFirst();0<r.getChildCount();){for(i=r.getFirst(),s=0;s<i.getChildCount();s++)(o=i.getChild(s)).type==CKEDITOR.NODE_ELEMENT&&(o.renameNode("td"),o.removeAttribute("scope"));i.insertBefore(d)}r.remove()}if(!this.hasColumnHeaders&&("col"==a||"both"==a))for(r=0;r<l.$.rows.length;r++)(o=new CKEDITOR.dom.element(l.$.rows[r].cells[0])).renameNode("th"),o.setAttribute("scope","row");if(this.hasColumnHeaders&&"col"!=a&&"both"!=a)for(s=0;s<l.$.rows.length;s++)"tbody"==(r=new CKEDITOR.dom.element(l.$.rows[s])).getParent().getName()&&((o=new CKEDITOR.dom.element(r.$.cells[0])).renameNode("td"),o.removeAttribute("scope"));n.txtHeight?l.setStyle("height",n.txtHeight):l.removeStyle("height"),n.txtWidth?l.setStyle("width",n.txtWidth):l.removeStyle("width"),l.getAttribute("style")||l.removeAttribute("style")}if(this._.selectedElement)try{e.selectBookmarks(t)}catch(m){}else g.insertElement(l),setTimeout(function(){var e=new CKEDITOR.dom.element(l.$.rows[0].cells[0]),t=g.createRange();t.moveToPosition(e,CKEDITOR.POSITION_AFTER_START),t.select()},0)},contents:[{id:"info",label:g.lang.table.title,elements:[{type:"hbox",widths:[null,null],styles:["vertical-align:top"],children:[{type:"vbox",padding:0,children:[{type:"text",id:"txtRows","default":3,label:g.lang.table.rows,required:!0,controlStyle:"width:5em",validate:l(g.lang.table.invalidRows),setup:function(e){this.setValue(e.$.rows.length)},commit:a},{type:"text",id:"txtCols","default":2,label:g.lang.table.columns,required:!0,controlStyle:"width:5em",validate:l(g.lang.table.invalidCols),setup:function(e){this.setValue(t(e))},commit:a},{type:"html",html:"&nbsp;"},{type:"select",id:"selHeaders",requiredContent:"th","default":"",label:g.lang.table.headers,items:[[g.lang.table.headersNone,""],[g.lang.table.headersRow,"row"],[g.lang.table.headersColumn,"col"],[g.lang.table.headersBoth,"both"]],setup:function(e){var t=this.getDialog();t.hasColumnHeaders=!0;for(var l=0;l<e.$.rows.length;l++){var n=e.$.rows[l].cells[0];if(n&&"th"!=n.nodeName.toLowerCase()){t.hasColumnHeaders=!1;break}}null!==e.$.tHead?this.setValue(t.hasColumnHeaders?"both":"row"):this.setValue(t.hasColumnHeaders?"col":"")},commit:a},{type:"text",id:"txtBorder",requiredContent:"table[border]","default":g.filter.check("table[border]")?1:0,label:g.lang.table.border,controlStyle:"width:3em",validate:CKEDITOR.dialog.validate.number(g.lang.table.invalidBorder),setup:function(e){this.setValue(e.getAttribute("border")||"")},commit:function(e,t){this.getValue()?t.setAttribute("border",this.getValue()):t.removeAttribute("border")}},{id:"cmbAlign",type:"select",requiredContent:"table[align]","default":"",label:g.lang.common.align,items:[[g.lang.common.notSet,""],[g.lang.common.alignLeft,"left"],[g.lang.common.alignCenter,"center"],[g.lang.common.alignRight,"right"]],setup:function(e){this.setValue(e.getAttribute("align")||"")},commit:function(e,t){this.getValue()?t.setAttribute("align",this.getValue()):t.removeAttribute("align")}}]},{type:"vbox",padding:0,children:[{type:"hbox",widths:["5em"],children:[{type:"text",id:"txtWidth",requiredContent:"table{width}",controlStyle:"width:5em",label:g.lang.common.width,title:g.lang.common.cssLengthTooltip,"default":g.filter.check("table{width}")?e.getSize("width")<500?"100%":500:0,getValue:i,validate:CKEDITOR.dialog.validate.cssLength(g.lang.common.invalidCssLength.replace("%1",g.lang.common.width)),onChange:function(){var e=this.getDialog().getContentElement("advanced","advStyles");e&&e.updateStyle("width",this.getValue())},setup:function(e){this.setValue(e.getStyle("width"))},commit:a}]},{type:"hbox",widths:["5em"],children:[{type:"text",id:"txtHeight",requiredContent:"table{height}",controlStyle:"width:5em",label:g.lang.common.height,title:g.lang.common.cssLengthTooltip,"default":"",getValue:i,validate:CKEDITOR.dialog.validate.cssLength(g.lang.common.invalidCssLength.replace("%1",g.lang.common.height)),onChange:function(){var e=this.getDialog().getContentElement("advanced","advStyles");e&&e.updateStyle("height",this.getValue())},setup:function(e){(e=e.getStyle("height"))&&this.setValue(e)},commit:a}]},{type:"html",html:"&nbsp;"},{type:"text",id:"txtCellSpace",requiredContent:"table[cellspacing]",controlStyle:"width:3em",label:g.lang.table.cellSpace,"default":g.filter.check("table[cellspacing]")?1:0,validate:CKEDITOR.dialog.validate.number(g.lang.table.invalidCellSpacing),setup:function(e){this.setValue(e.getAttribute("cellSpacing")||"")},commit:function(e,t){this.getValue()?t.setAttribute("cellSpacing",this.getValue()):t.removeAttribute("cellSpacing")}},{type:"text",id:"txtCellPad",requiredContent:"table[cellpadding]",controlStyle:"width:3em",label:g.lang.table.cellPad,"default":g.filter.check("table[cellpadding]")?1:0,validate:CKEDITOR.dialog.validate.number(g.lang.table.invalidCellPadding),setup:function(e){this.setValue(e.getAttribute("cellPadding")||"")},commit:function(e,t){this.getValue()?t.setAttribute("cellPadding",this.getValue()):t.removeAttribute("cellPadding")}}]}]},{type:"html",align:"right",html:""},{type:"vbox",padding:0,children:[{type:"text",id:"txtCaption",requiredContent:"caption",label:g.lang.table.caption,setup:function(e){if(this.enable(),0<(e=e.getElementsByTag("caption")).count()){var t=(e=e.getItem(0)).getFirst(CKEDITOR.dom.walker.nodeType(CKEDITOR.NODE_ELEMENT));t&&!t.equals(e.getBogus())?(this.disable(),this.setValue(e.getText())):(e=CKEDITOR.tools.trim(e.getText()),this.setValue(e))}},commit:function(e,t){if(this.isEnabled()){var l=this.getValue(),n=t.getElementsByTag("caption");if(l)0<n.count()?(n=n.getItem(0)).setHtml(""):(n=new CKEDITOR.dom.element("caption",g.document),t.getChildCount()?n.insertBefore(t.getFirst()):n.appendTo(t)),n.append(new CKEDITOR.dom.text(l,g.document));else if(0<n.count())for(l=n.count()-1;0<=l;l--)n.getItem(l).remove()}}},{type:"text",id:"txtSummary",bidi:!0,requiredContent:"table[summary]",label:g.lang.table.summary,setup:function(e){this.setValue(e.getAttribute("summary")||"")},commit:function(e,t){this.getValue()?t.setAttribute("summary",this.getValue()):t.removeAttribute("summary")}}]}]},m&&m.createAdvancedTab(g,null,"table")]}}var i=CKEDITOR.tools.cssLength,a=function(e){var t=this.id;e.info||(e.info={}),e.info[t]=this.getValue()};CKEDITOR.dialog.add("table",function(e){return n(e,"table")}),CKEDITOR.dialog.add("tableProperties",function(e){return n(e,"tableProperties")})}();