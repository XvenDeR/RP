(function(t){function e(e){for(var n,a,r=e[0],c=e[1],l=e[2],d=0,f=[];d<r.length;d++)a=r[d],s[a]&&f.push(s[a][0]),s[a]=0;for(n in c)Object.prototype.hasOwnProperty.call(c,n)&&(t[n]=c[n]);u&&u(e);while(f.length)f.shift()();return o.push.apply(o,l||[]),i()}function i(){for(var t,e=0;e<o.length;e++){for(var i=o[e],n=!0,r=1;r<i.length;r++){var c=i[r];0!==s[c]&&(n=!1)}n&&(o.splice(e--,1),t=a(a.s=i[0]))}return t}var n={},s={app:0},o=[];function a(e){if(n[e])return n[e].exports;var i=n[e]={i:e,l:!1,exports:{}};return t[e].call(i.exports,i,i.exports,a),i.l=!0,i.exports}a.m=t,a.c=n,a.d=function(t,e,i){a.o(t,e)||Object.defineProperty(t,e,{enumerable:!0,get:i})},a.r=function(t){"undefined"!==typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(t,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(t,"__esModule",{value:!0})},a.t=function(t,e){if(1&e&&(t=a(t)),8&e)return t;if(4&e&&"object"===typeof t&&t&&t.__esModule)return t;var i=Object.create(null);if(a.r(i),Object.defineProperty(i,"default",{enumerable:!0,value:t}),2&e&&"string"!=typeof t)for(var n in t)a.d(i,n,function(e){return t[e]}.bind(null,n));return i},a.n=function(t){var e=t&&t.__esModule?function(){return t["default"]}:function(){return t};return a.d(e,"a",e),e},a.o=function(t,e){return Object.prototype.hasOwnProperty.call(t,e)},a.p="";var r=window["webpackJsonp"]=window["webpackJsonp"]||[],c=r.push.bind(r);r.push=e,r=r.slice();for(var l=0;l<r.length;l++)e(r[l]);var u=c;o.push([0,"chunk-vendors"]),i()})({0:function(t,e,i){t.exports=i("56d7")},"0134":function(t,e,i){},"034f":function(t,e,i){"use strict";var n=i("3fa8"),s=i.n(n);s.a},"2fb5":function(t,e,i){"use strict";var n=i("bac7"),s=i.n(n);s.a},"30b2":function(t,e,i){},"3fa8":function(t,e,i){},"56d7":function(t,e,i){"use strict";i.r(e);i("da18"),i("76bb"),i("3c76"),i("ddac");var n=i("192b"),s=function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("v-app",{attrs:{dark:""}},[i("InputDialog",{ref:"inputDialog",attrs:{title:t.inputBoxTitle,hint:t.inputBoxHint,active:t.input_dialog_active}}),i("Notifications",{ref:"notifications"}),i("StateIcons"),i("InventoryMenu",{ref:"inventory",attrs:{id:"inventory",title:"Инвентарь",parent_disabled:t.inventory_disabled}})],1)},o=[],a=function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("v-container",[i("v-layout",{directives:[{name:"show",rawName:"v-show",value:t.shown(),expression:"shown()"}],staticStyle:{position:"absolute",right:"100px",top:"10%",width:"400px",height:"70%"}},[i("v-dialog",{attrs:{scrollable:"",modal:"","max-width":"400px","no-click-animation":"","content-class":"inventory-dialog-content",transition:"inventory-transition",disabled:t.disabled,"hide-overlay":"",persistent:""},model:{value:t.dialogVisible,callback:function(e){t.dialogVisible=e},expression:"dialogVisible"}},[i("ListMenu",{ref:"actionMenu",attrs:{title:"Действия",items:t.currentActions,parent_disabled:t.disabled,back_button:""},on:{item_clicked:t.action_clicked,back_clicked:t.back_clicked}},[t._l(t.currentActions,function(e,n){return i("template",{slot:"content-"+n},[e.icon?i("v-list-item-avatar",{key:"icon-"+n},[i("v-icon",{domProps:{innerHTML:t._s(t.icons[e.icon])}})],1):t._e(),i("v-list-item-content",{key:"content-"+n},[i("v-list-item-title",[t._v(t._s(e.label))]),i("v-list-item-subtitle")],1)],1)})],2),i("ListMenu",{ref:"itemMenu",attrs:{title:"Инвентарь",items:t.items,parent_disabled:t.disabled,filter_title:"",back_button:""},on:{item_clicked:t.item_clicked,back_clicked:t.back_clicked}},[t._l(t.items,function(t,e){return i("template",{slot:"avatar-"+e},[i("InventoryItemAvatarPane",{key:"avatar-"+e,attrs:{item:t}})],1)}),t._l(t.items,function(t,e){return i("template",{slot:"content-"+e},[i("InventoryItemContentPane",{key:"content-"+e,attrs:{item:t}})],1)}),t._l(t.items,function(t,e){return i("template",{slot:"action-"+e},[i("InventoryItemActionPane",{key:"action-"+e,attrs:{item:t}})],1)})],2)],1)],1)],1)},r=[],c=(i("e295"),function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("v-card",{directives:[{name:"show",rawName:"v-show",value:t.show,expression:"show"}],attrs:{elevation:"0",tile:""}},[i("v-card-title",{staticClass:"pa-0"},[i("v-toolbar",{attrs:{dark:""}},[i("v-btn",{directives:[{name:"show",rawName:"v-show",value:t.back_button,expression:"back_button"}],ref:"backButton",attrs:{small:"",text:"",icon:"",color:"white"},on:{click:function(e){return t.$emit("back_clicked")}}},[i("v-icon",[t._v(t._s(t.mdi_arrow_left))])],1),i("v-toolbar-title",{staticStyle:{"user-select":"none"}},[t._v(t._s(t.title))]),i("v-spacer"),i("v-toolbar-items",[i("v-text-field",{directives:[{name:"show",rawName:"v-show",value:t.filter_title,expression:"filter_title"}],ref:"filterField",staticClass:"pt-4",staticStyle:{"max-width":"150px"},attrs:{label:"Поиск","append-icon":"mdi-magnify",height:"30px"},on:{focus:function(e){t.filter_focus=!0},blur:function(e){t.filter_focus=!1},input:function(e){return t.search_field_changed(e)}}})],1)],1)],1),i("v-card-text",{ref:"list-card-text"},[i("v-list",{attrs:{nav:""}},[i("v-list-item-group",{attrs:{color:"primary"},model:{value:t.selected_index,callback:function(e){t.selected_index=e},expression:"selected_index"}},t._l(t.items,function(e,n){return i("TextListItem",{directives:[{name:"show",rawName:"v-show",value:t.filtered(e),expression:"filtered(item)"}],key:n,ref:"list-item",refInFor:!0,attrs:{item:e,value:n},on:{click:function(i){return t.$emit("item_clicked",e,n)}},scopedSlots:t._u([{key:"avatar",fn:function(){return[t._t("avatar-"+n)]},proxy:!0},{key:"content",fn:function(){return[t._t("content-"+n)]},proxy:!0},{key:"action",fn:function(){return[t._t("action-"+n)]},proxy:!0}],null,!0)})}),1)],1)],1)],1)}),l=[],u=(i("bb4e"),i("338c"),i("12cd"),function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("v-list-item",{attrs:{item:t.item,value:t.value},on:{click:function(e){return t.$emit("click")}}},[t._t("avatar"),t._t("content"),t._t("action")],2)}),d=[],f=(i("719f"),{props:{item:{type:Object,default:function(){}},onclick:{type:Object,default:null},value:{type:Number,default:0}},data:function(){return{}},methods:{}}),h=f,m=i("e707"),v=i("67d4"),p=i.n(v),_=i("3d2b"),b=Object(m["a"])(h,u,d,!1,null,null,null),y=b.exports;p()(b,{VListItem:_["a"]});var x=i("9855"),w={components:{TextListItem:y},props:{title:{type:String,default:""},items:{default:function(){return[]}},filter_title:{type:Boolean,default:!1},parent_disabled:{type:Boolean,default:!1},back_button:{type:Boolean,default:!1}},data:function(){return{selected_index:0,show:!1,filter_string:"",filter_focus:!1,_disabled:!1,mdi_arrow_left:x["b"]}},computed:{disabled:{get:function(){return this._disabled||this.parent_disabled||!this.shown()},set:function(t){this._disabled=t}}},watch:{show:function(t){this.$nextTick(function(){this.$refs["backButton"]&&this.$refs["backButton"].$el.blur()})}},methods:{key_down:function(t){this.disabled||(38==t.keyCode&&this.selection_prev(),40==t.keyCode&&this.selection_next(),13==t.keyCode&&this.selection_apply())},shown:function(){return this.show},showDialog:function(){this.show=!0},hideDialog:function(){this.show=!1},filterItems:function(t){var e=this;if(void 0===t)return this.console.error("ListMenu: undefined items in filter!"),{};if(void 0==t.filter)return{};var i=t.filter(function(t){return e.filtered(t)});return i},filtered:function(t){return new String(t.label).toLowerCase().includes(this.filter_string.toLowerCase())},search_field_changed:function(t){this.selected_index=0,this.filter_string=t},toString:function(t){return t.toString()},moveScroll:function(){if(this.selected_index||(this.selected_index=0),!(this.items.length<=this.selected_index||this.selected_index<0)&&this.$refs["list-item"]){var t=this.$refs["list-item"][this.selected_index];this.$refs["list-card-text"].scrollTop=t.$el.offsetTop}},selection_set:function(t){this.selected_index=t,this.moveScroll()},selection_next:function(){this.disabled||(this.selected_index<this.items.length-1&&(this.selected_index=this.selected_index+1),this.moveScroll())},selection_prev:function(){this.disabled||(this.selected_index>0&&(this.selected_index=this.selected_index-1),this.moveScroll())},selection_apply:function(){if(!this.disabled){var t=this.items[this.selected_index];t&&this.$emit("item_clicked",t,this.selected_index)}}},created:function(){this.$eventHub.$on("key_down",this.key_down)},beforeDestroy:function(){this.$eventHub.$off("key_down")}},g=w,k=(i("2fb5"),i("3f29")),$=i("d6aa"),I=i("ac87"),V=i("04de"),C=i("4397"),T=i("55a3"),S=i("cd2e"),L=i("5939"),M=i("eba3"),O=i("ceeb"),H=Object(m["a"])(g,c,l,!1,null,null,null),j=H.exports;p()(H,{VBtn:k["a"],VCard:$["a"],VCardText:I["b"],VCardTitle:I["c"],VIcon:V["a"],VList:C["a"],VListItemGroup:T["a"],VSpacer:S["a"],VTextField:L["a"],VToolbar:M["a"],VToolbarItems:O["a"],VToolbarTitle:O["b"]});var N=function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("v-list-item-action",[i("v-list-item-action-text",{staticClass:"font-weight-medium"},[i("v-layout",{attrs:{"align-end":"","justify-space-around":"",column:"","fill-height":""}},["money"===t.item.name||"account_money"===t.item.name||"black_money"===t.item.name?i("v-flex",[i("v-flex",{staticClass:"subtitle-1 text-end green--text text--darken-2"},[t._v("$ "+t._s(t.formatted_money(t.item.count)))])],1):i("v-flex",[i("v-flex",{directives:[{name:"show",rawName:"v-show",value:t.item.weight>=.005,expression:"item.weight >= 0.005"}],staticClass:"text-end"},[t._v(t._s(t.item.weight)+" кг")]),i("v-flex",{directives:[{name:"show",rawName:"v-show",value:("weapon"===t.item.name||"equipped_weapon"===t.item.name)&&!t.item.melee,expression:"(item.name === 'weapon' || item.name === 'equipped_weapon') && !item.melee"}]},[i("v-icon",{attrs:{dense:"",small:""}},[t._v(t._s(t.mdi_bullet))]),i("span",{staticClass:"mt-1"},[t._v(t._s(t.item.ammo))])],1)],1)],1)],1)],1)},B=[],D=(i("ecfd"),i("9b8f"),{data:function(){return{mdi_bullet:x["c"]}},props:{item:{default:null}},methods:{formatted_money:function(t){return A(t,t>=10?0:2,"."," ")}}});function A(t,e,i,n){var s=isFinite(+t)?+t:0,o=isFinite(+e)?Math.abs(e):0,a="undefined"===typeof n?",":n,r="undefined"===typeof i?".":i,c=function(t,e){var i=Math.pow(10,e);return Math.round(t*i)/i},l=(o?c(s,o):Math.round(s)).toString().split(".");return l[0].length>3&&(l[0]=l[0].replace(/\B(?=(?:\d{3})+(?!\d))/g,a)),(l[1]||"").length<o&&(l[1]=l[1]||"",l[1]+=new Array(o-l[1].length+1).join("0")),l.join(r)}var P=D,E=i("26ff"),F=i("919a"),q=i("b9f4"),z=i("f1d1"),J=Object(m["a"])(P,N,B,!1,null,null,null),G=J.exports;p()(J,{VFlex:E["a"],VIcon:V["a"],VLayout:F["a"],VListItemAction:q["a"],VListItemActionText:z["a"]});var K=function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("v-list-item-content",[i("v-list-item-title",[i("span",{staticClass:"font-weight-medium blue-grey--text text--darken-4",domProps:{innerHTML:t._s(t.item.label)}}),i("span",{directives:[{name:"show",rawName:"v-show",value:t.item.count>1&&"money"!=t.item.name&&"account_money"!=t.item.name&&"black_money"!=t.item.name,expression:"item.count > 1 && item.name != 'money' && item.name != 'account_money' && item.name != 'black_money'"}],staticClass:"grey--text text--lighten-1"},[t._v(" x"+t._s(t.item.count))])]),i("v-list-item-subtitle",[t._v(t._s(t.item.description))])],1)},R=[],U={data:function(){return{mdi_ammunition:x["a"]}},props:{item:{default:null}},methods:{}},X=U,Q=Object(m["a"])(X,K,R,!1,null,null,null),W=Q.exports;p()(Q,{VListItemContent:z["b"],VListItemSubtitle:z["c"],VListItemTitle:z["d"]});var Y=function(){var t=this,e=t.$createElement,i=t._self._c||e;return t.item.icon?i("v-list-item-avatar",[i("v-icon",[t._v(t._s(t.item.icon))])],1):t._e()},Z=[],tt={data:function(){return{mdi_ammunition:x["a"]}},props:{item:{default:null}},methods:{}},et=tt,it=i("3e5d"),nt=Object(m["a"])(et,Y,Z,!1,null,null,null),st=nt.exports;p()(nt,{VIcon:V["a"],VListItemAvatar:it["a"]});var ot={components:{ListMenu:j,InventoryItemActionPane:G,InventoryItemContentPane:W,InventoryItemAvatarPane:st},props:{parent_disabled:{type:Boolean,default:!1}},data:function(){return{filter_string:"",state:"hide",_disabled:!1,currentItem:null,currentActions:[],items:{},icons:{"close-circle":x["d"],"keyboard-return":x["f"]},dialogVisible:!1}},computed:{disabled:{get:function(){return this._disabled||this.parent_disabled},set:function(t){this._disabled=t}}},watch:{currentItem:function(t){this.actions=this.generate_actions(t)},disabled:function(t){},state:function(t){this.dialogVisible="hide"!=t,this.$nextTick(function(){switch(t){case"items":this.$refs["actionMenu"].hideDialog(),this.$refs["itemMenu"].showDialog();break;case"actions":this.$refs["actionMenu"].showDialog(),this.$refs["itemMenu"].hideDialog();break;case"hide":window.post("http://sosamba_ui/close"),this.$refs["actionMenu"].hideDialog(),this.$refs["itemMenu"].hideDialog();break;default:this.console.error("Incorrect inventory state! State: "+this.state)}})}},methods:{message:function(t){switch(t.action){case"updateInventory":this.items=t.items,this.items||(this.items={});break}},show:function(){"hide"==this.state&&(this.state="items")},hide:function(){this.state="hide"},shown:function(){return"hide"!=this.state},key_down:function(t){"hide"!=this.state&&1!=this.disabled&&(this.$refs.itemMenu.filter_focus||(37==t.keyCode&&this.back_clicked(),39==t.keyCode&&"items"==this.state&&(this.state="actions"),8!=t.keyCode&&27!=t.keyCode||this.back_clicked()))},item_clicked:function(t,e){if("hide"!=this.state&&1!=this.disabled)if(e in this.items){for(var i in this.currentItem=e,this.currentActions=[],this.items[e].actions){var n=this.items[e].actions[i];n.item=this.items[e].item,this.currentActions.push(n)}this.$refs["actionMenu"].$forceUpdate(),this.state="actions",this.$refs["actionMenu"].selection_set(0)}else this.console.error("Item not in list!")},do_action:function(t,e){if("return"!=e.name){var i=JSON.stringify(e);window.post("http://sosamba_ui/do_action",i)}},action_clicked:function(t){"hide"!=this.state&&1!=this.disabled&&(null!=t&&this.do_action(this.currentItem,t),this.state="items")},back_clicked:function(){"hide"!=this.state&&1!=this.disabled&&("actions"==this.state?this.state="items":"items"==this.state&&(this.state="hide"))},generate_actions:function(t){var e=this.items[t];if(null==e)return[];var i=[];for(var n in e.actions){var s=e.actions[n];i.push({text:{title:s.label},icon:s.icon,key:n,item:e.item})}return i},generate_items:function(t){var e=[];for(var i in t){var n=t[i],s=n.description,o="";n.count>1&&(o='<span class="grey--text text--lighten-1"> x'+n.count+"</span>");var a="";e.push({text:{title:n.label+o,subtitle:s,right:a},key:i,enter:!1})}return e}},created:function(){this.$eventHub.$on("key_down",this.key_down),this.$eventHub.$on("message",this.message)},beforeDestroy:function(){this.$eventHub.$off("key_down"),this.$eventHub.$off("message")}},at=ot,rt=i("4673"),ct=i("bc28"),lt=Object(m["a"])(at,a,r,!1,null,null,null),ut=lt.exports;p()(lt,{VContainer:rt["a"],VDialog:ct["a"],VIcon:V["a"],VLayout:F["a"],VListItemAvatar:it["a"],VListItemContent:z["b"],VListItemSubtitle:z["c"],VListItemTitle:z["d"]});var dt=function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("v-layout",{attrs:{"justify-center":""}},[i("v-dialog",{attrs:{persistent:"",modal:"","max-width":"290"},model:{value:t.active,callback:function(e){t.active=e},expression:"active"}},[i("v-card",[i("v-card-title",{staticClass:"title"},[t._v(t._s(t.title))]),i("v-card-text",[i("v-text-field",{ref:"textfield",attrs:{label:t.hint},model:{value:t.text,callback:function(e){t.text=e},expression:"text"}})],1),i("v-card-actions",[i("v-spacer"),i("v-btn",{attrs:{color:"green darken-1",text:""},on:{click:function(e){return t.hide()}}},[t._v("OK")])],1)],1)],1)],1)},ft=[],ht={props:{title:{type:String,default:""},hint:{type:String,default:""}},data:function(){return{callback:void 0,active:!1,text:""}},methods:{key_down:function(t){0!=this.active&&"Enter"==t.key&&this.hide()},show:function(t){this.callback=t,this.active=!0,this.data.text="",this.$nextTick(function(){this.$refs.textfield.focus()})},hide:function(){this.active=!1,this.callback&&this.callback(this.text)}},created:function(){this.$eventHub.$on("key_down",this.key_down)},beforeDestroy:function(){this.$eventHub.$off("key_down")}},mt=ht,vt=Object(m["a"])(mt,dt,ft,!1,null,null,null),pt=vt.exports;p()(vt,{VBtn:k["a"],VCard:$["a"],VCardActions:I["a"],VCardText:I["b"],VCardTitle:I["c"],VDialog:ct["a"],VLayout:F["a"],VSpacer:S["a"],VTextField:L["a"]});var _t=function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("transition-group",{attrs:{name:"notifymove",id:"notifications",tag:"div"}},t._l(t.notifications,function(e){return i("Notification",{key:e.id,attrs:{notification:e},domProps:{innerHTML:t._s(e.text)},on:{expired:function(i){return t.removeNotification(e)}}})}),1)},bt=[],yt=function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"black-container font-weight-medium"},[t._t("default")],2)},xt=[],wt=n["a"].extend({props:["notification"],mounted:function(){var t=this;setTimeout(function(){return t.$emit("expired",alert)},1e4)}}),gt=wt,kt=(i("cf76"),Object(m["a"])(gt,yt,xt,!1,null,null,null)),$t=kt.exports,It={components:{Notification:$t},data:function(){return{notifications:[],notificationIndex:0}},methods:{message:function(t){"showNotification"==t.action&&this.createNotification(t.text)},createNotification:function(t){this.notifications.push({id:this.notificationIndex++,text:t})},removeNotification:function(t){this.notifications.splice(this.notifications.indexOf(t),1)}},created:function(){this.$eventHub.$on("message",this.message)},beforeDestroy:function(){this.$eventHub.$off("message")}},Vt=It,Ct=(i("6179"),Object(m["a"])(Vt,_t,bt,!1,null,"514c7868",null)),Tt=Ct.exports,St=function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticStyle:{position:"absolute",bottom:"10px",left:"16%"}},[i("v-icon",{directives:[{name:"show",rawName:"v-show",value:t.needs["armor"]>0,expression:"needs['armor']>0"}],ref:"icon-armor",style:{color:t.armorColor},attrs:{size:"50px"}},[t._v(t._s(t.icons["shield-half-full"]))]),i("v-icon",{directives:[{name:"show",rawName:"v-show",value:t.needs["hunger"]<.5,expression:"needs['hunger']<0.5"}],ref:"icon-hunger",style:{color:t.hungerColor},attrs:{size:"50px"}},[t._v(t._s(t.icons["food"]))]),i("v-icon",{directives:[{name:"show",rawName:"v-show",value:t.needs["thirst"]<.5,expression:"needs['thirst']<0.5"}],ref:"icon-thirst",style:{color:t.thirstColor},attrs:{size:"50px"}},[t._v(t._s(t.icons["water"]))]),i("v-icon",{directives:[{name:"show",rawName:"v-show",value:t.needs["health"]<.9,expression:"needs['health']<0.9"}],ref:"icon-health",style:{color:t.healthColor},attrs:{size:"50px"}},[t._v(t._s(t.icons["medical-bag"]))])],1)},Lt=[],Mt={data:function(){return{icons:{food:x["e"],water:x["i"],"medical-bag":x["g"],"shield-half-full":x["h"]},needs:{}}},methods:{message:function(t){"setNeeds"==t.action&&(this.needs=t)}},computed:{armorColor:function(){var t=this.needs["armor"];return void 0===t&&(t=0),"rgba(255,128,0, "+.7*t+")"},hungerColor:function(){var t=this.needs["hunger"],e=.5;return t>e&&(t=e),t=(e-t)/e,void 0===t&&(t=0),"rgba(255,128,0, "+.7*t+")"},thirstColor:function(){var t=this.needs["thirst"],e=.5;return t>e&&(t=e),t=(e-t)/e,void 0===t&&(t=0),"rgba(255,128,0, "+.7*t+")"},healthColor:function(){var t=255-255*this.needs["health"];t<0&&(t=0);var e=255*this.needs["health"];e>255&&(e=255);var i=this.needs["health"],n=.9;return i>n&&(i=n),i=Math.sqrt((n-i)/n),void 0===i&&(i=0),"rgba("+t+","+e+",0, "+.7*i+")"}},created:function(){this.$eventHub.$on("message",this.message)},beforeDestroy:function(){this.$eventHub.$off("message")}},Ot=Mt,Ht=Object(m["a"])(Ot,St,Lt,!1,null,null,null),jt=Ht.exports;p()(Ht,{VIcon:V["a"]});var Nt={name:"App",ref:"app",components:{InventoryMenu:ut,InputDialog:pt,Notifications:Tt,StateIcons:jt},watch:{state:function(t){switch(this.inventory_disabled=!1,t){case"inventory":this.$refs.inventory.show();break;case"main":this.$refs.inventory.hide();break;case"modal":this.inventory_disabled=!0;break}}},data:function(){return{state:"main",input_dialog_active:!1,inventory_disabled:!1,inputBoxTitle:"",inputBoxHint:""}},methods:{showInputBox:function(t){var e=this.state;this.state="modal";var i=this;this.$refs.inputDialog.show(function(n){t(n),i.state=e})},showInventory:function(t){1==t?this.state="inventory":"inventory"==this.state&&(this.state="main")},message:function(t){switch(t.action){case"showInventory":this.showInventory(t.value);break;case"showInputBox":t.title?this.inputBoxTitle=t.title:this.inputBoxTitle="Введите количество",t.hint?this.inputBoxHint=t.hint:this.inputBoxHint="Введите число",this.showInputBox(function(e){t.text=e,window.post("http://sosamba_ui/inputbox",JSON.stringify(t))});break;case"menuActive":0==t.value&&(this.state="main");break}}},created:function(){this.$eventHub.$on("message",this.message)},beforeDestroy:function(){this.$eventHub.$off("message")}},Bt=Nt,Dt=(i("034f"),i("7fc8")),At=Object(m["a"])(Bt,s,o,!1,null,null,null),Pt=At.exports;p()(At,{VApp:Dt["a"]});var Et=i("7fc3");n["a"].use(Et["a"]);var Ft=new Et["a"]({icons:{iconfont:"mdiSvg"},theme:{themes:{light:{primary:"#169ab1",secondary:"#f44336",accent:"#8bc34a",error:"#ff5722",warning:"#ffc107",info:"#009688",success:"#4caf50"}}}});n["a"].config.productionTip=!1,n["a"].prototype.$eventHub=new n["a"],n["a"].prototype.console=console;var qt=new n["a"]({vuetify:Ft,render:function(t){return t(Pt)},renderError:function(t,e){return t("pre",{style:{color:"red"}},e.stack)}}).$mount("#app");window.addEventListener("touchmove",function(){}),document.addEventListener("keydown",function(t){qt.$eventHub.$emit("key_down",t)}),window.onload=function(){window.addEventListener("message",function(t){qt.$eventHub.$emit("message",t.data)})},window.post=function(t,e){var i=new XMLHttpRequest;i.open("POST",t,!0),i.onreadystatechange=function(){4==this.readyState&&200==this.status&&this.console.log("HTTP status: "+this.status)},e?i.send(e):i.send()}},6179:function(t,e,i){"use strict";var n=i("30b2"),s=i.n(n);s.a},bac7:function(t,e,i){},cf76:function(t,e,i){"use strict";var n=i("0134"),s=i.n(n);s.a}});
//# sourceMappingURL=app.js.map