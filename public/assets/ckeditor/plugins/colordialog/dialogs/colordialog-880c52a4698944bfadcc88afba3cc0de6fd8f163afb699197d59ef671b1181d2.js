CKEDITOR.dialog.add("colordialog",function(n){function t(){b.getById(h).removeStyle("background-color"),o.getContentElement("picker","selectedColor").setValue(""),l&&l.removeAttribute("aria-selected"),l=null}function s(e){var t;"td"==(e=e.data.getTarget()).getName()&&(t=e.getChild(0).getHtml())&&((l=e).setAttribute("aria-selected",!0),o.getContentElement("picker","selectedColor").setValue(t))}function r(e){e=e.replace(/^#/,"");for(var t=0,o=[];t<=2;t++)o[t]=parseInt(e.substr(2*t,2),16);return"#"+(165<=.2126*o[0]+.7152*o[1]+.0722*o[2]?"000":"fff")}function d(e){!e.name&&(e=new CKEDITOR.event(e));var t,o=!/mouse/.test(e.name),l=e.data.getTarget();"td"==l.getName()&&(t=l.getChild(0).getHtml())&&(c(e),o?a=l:i=l,o&&(l.setStyle("border-color",r(t)),l.setStyle("border-style","dotted")),b.getById(m).setStyle("background-color",t),b.getById(v).setHtml(t))}function c(e){if(e=!/mouse/.test(e.name)&&a){var t=e.getChild(0).getHtml();e.setStyle("border-color",t),e.setStyle("border-style","solid")}!a&&!i&&(b.getById(m).removeStyle("background-color"),b.getById(v).setHtml("&nbsp;"))}function g(e){var t=e.data,o=t.getTarget(),l=t.getKeystroke(),r="rtl"==n.lang.dir;switch(l){case 38:(e=o.getParent().getPrevious())&&(e=e.getChild([o.getIndex()])).focus(),t.preventDefault();break;case 40:(e=o.getParent().getNext())&&(e=e.getChild([o.getIndex()]))&&1==e.type&&e.focus(),t.preventDefault();break;case 32:case 13:s(e),t.preventDefault();break;case r?37:39:(e=o.getNext())?1==e.type&&(e.focus(),t.preventDefault(!0)):(e=o.getParent().getNext())&&(e=e.getChild([0]))&&1==e.type&&(e.focus(),t.preventDefault(!0));break;case r?39:37:(e=o.getPrevious())?(e.focus(),t.preventDefault(!0)):(e=o.getParent().getPrevious())&&((e=e.getLast()).focus(),t.preventDefault(!0))}}var o,l,a,i,u,p=CKEDITOR.dom.element,b=CKEDITOR.document,y=n.lang.colordialog,e={type:"html",html:"&nbsp;"},f=function(e){return CKEDITOR.tools.getNextId()+"_"+e},m=f("hicolor"),v=f("hicolortext"),h=f("selhicolor");return function(){function e(e,t){for(var o=e;o<e+3;o++){var l=new p(u.$.insertRow(-1));l.setAttribute("role","row");for(var r=t;r<t+3;r++)for(var n=0;n<6;n++)a(l.$,"#"+i[r]+i[n]+i[o])}}function a(e,t){var o=new p(e.insertCell(-1));o.setAttribute("class","ColorCell"),o.setAttribute("tabIndex",-1),o.setAttribute("role","gridcell"),o.on("keydown",g),o.on("click",s),o.on("focus",d),o.on("blur",c),o.setStyle("background-color",t),o.setStyle("border","1px solid "+t),o.setStyle("width","14px"),o.setStyle("height","14px");var l=f("color_table_cell");o.setAttribute("aria-labelledby",l),o.append(CKEDITOR.dom.element.createFromHtml('<span id="'+l+'" class="cke_voice_label">'+t+"</span>",CKEDITOR.document))}(u=CKEDITOR.dom.element.createFromHtml('<table tabIndex="-1" aria-label="'+y.options+'" role="grid" style="border-collapse:separate;" cellspacing="0"><caption class="cke_voice_label">'+y.options+'</caption><tbody role="presentation"></tbody></table>')).on("mouseover",d),u.on("mouseout",c);var i="00 33 66 99 cc ff".split(" ");e(0,0),e(3,0),e(0,3),e(3,3);var t=new p(u.$.insertRow(-1));t.setAttribute("role","row"),a(t.$,"#000000");for(var o=0;o<16;o++){var l=o.toString(16);a(t.$,"#"+l+l+l+l+l+l)}a(t.$,"#ffffff")}(),{title:y.title,minWidth:360,minHeight:220,onLoad:function(){o=this},onHide:function(){t();var e=a.getChild(0).getHtml();a.setStyle("border-color",e),a.setStyle("border-style","solid"),b.getById(m).removeStyle("background-color"),b.getById(v).setHtml("&nbsp;"),a=null},contents:[{id:"picker",label:y.title,accessKey:"I",elements:[{type:"hbox",padding:0,widths:["70%","10%","30%"],children:[{type:"html",html:"<div></div>",onLoad:function(){CKEDITOR.document.getById(this.domId).append(u)},focus:function(){(a||this.getElement().getElementsByTag("td").getItem(0)).focus()}},e,{type:"vbox",padding:0,widths:["70%","5%","25%"],children:[{type:"html",html:"<span>"+y.highlight+'</span><div id="'+m+'" style="border: 1px solid; height: 74px; width: 74px;"></div><div id="'+v+'">&nbsp;</div><span>'+y.selected+'</span><div id="'+h+'" style="border: 1px solid; height: 20px; width: 74px;"></div>'},{type:"text",label:y.selected,labelStyle:"display:none",id:"selectedColor",style:"width: 76px;margin-top:4px",onChange:function(){try{b.getById(h).setStyle("background-color",this.getValue())}catch(e){t()}}},e,{type:"button",id:"clear",label:y.clear,onClick:t}]}]}]}]}});