import{importShared as Sn,__tla as se}from"./__federation_fn_import.js";import{_ as z,a as st}from"./inheritsLoose-1db512d6.js";import{_ as V,h as fe}from"./hoist-non-react-statics.cjs-e0c24d9b.js";import{P as ft,_ as le,a as vn}from"./setPrototypeOf-15ee5953.js";import{g as pe}from"./_commonjsHelpers-de833af9.js";let lt,pt,Mn,ht,vt,dt,mt,yt,nn,gt,wt,dn,tn,xt,jn,Et,bt,Ct,he=Promise.all([(()=>{try{return se}catch{}})()]).then(async()=>{function mn(n,t){if(n==null)return{};var r={},e=Object.keys(n),o,i;for(i=0;i<e.length;i++)o=e[i],!(t.indexOf(o)>=0)&&(r[o]=n[o]);return r}function an(n){return n.charAt(0)==="/"}function yn(n,t){for(var r=t,e=r+1,o=n.length;e<o;r+=1,e+=1)n[r]=n[e];n.pop()}function At(n,t){t===void 0&&(t="");var r=n&&n.split("/")||[],e=t&&t.split("/")||[],o=n&&an(n),i=t&&an(t),a=o||i;if(n&&an(n)?e=r:r.length&&(e.pop(),e=e.concat(r)),!e.length)return"/";var u;if(e.length){var s=e[e.length-1];u=s==="."||s===".."||s===""}else u=!1;for(var c=0,f=e.length;f>=0;f--){var l=e[f];l==="."?yn(e,f):l===".."?(yn(e,f),c++):c&&(yn(e,f),c--)}if(!a)for(;c--;c)e.unshift("..");a&&e[0]!==""&&(!e[0]||!an(e[0]))&&e.unshift("");var p=e.join("/");return u&&p.substr(-1)!=="/"&&(p+="/"),p}function In(n){return n.valueOf?n.valueOf():Object.prototype.valueOf.call(n)}function cn(n,t){if(n===t)return!0;if(n==null||t==null)return!1;if(Array.isArray(n))return Array.isArray(t)&&n.length===t.length&&n.every(function(o,i){return cn(o,t[i])});if(typeof n=="object"||typeof t=="object"){var r=In(n),e=In(t);return r!==n||e!==t?cn(r,e):Object.keys(Object.assign({},n,t)).every(function(o){return cn(n[o],t[o])})}return!1}var Pt=!0,gn="Invariant failed";function J(n,t){if(!n){if(Pt)throw new Error(gn);var r=typeof t=="function"?t():t,e=r?"".concat(gn,": ").concat(r):gn;throw new Error(e)}}function en(n){return n.charAt(0)==="/"?n:"/"+n}function Hn(n){return n.charAt(0)==="/"?n.substr(1):n}function Rt(n,t){return n.toLowerCase().indexOf(t.toLowerCase())===0&&"/?#".indexOf(n.charAt(t.length))!==-1}function Nn(n,t){return Rt(n,t)?n.substr(t.length):n}function Bn(n){return n.charAt(n.length-1)==="/"?n.slice(0,-1):n}function kt(n){var t=n||"/",r="",e="",o=t.indexOf("#");o!==-1&&(e=t.substr(o),t=t.substr(0,o));var i=t.indexOf("?");return i!==-1&&(r=t.substr(i),t=t.substr(0,i)),{pathname:t,search:r==="?"?"":r,hash:e==="#"?"":e}}function j(n){var t=n.pathname,r=n.search,e=n.hash,o=t||"/";return r&&r!=="?"&&(o+=r.charAt(0)==="?"?r:"?"+r),e&&e!=="#"&&(o+=e.charAt(0)==="#"?e:"#"+e),o}function U(n,t,r,e){var o;typeof n=="string"?(o=kt(n),o.state=t):(o=V({},n),o.pathname===void 0&&(o.pathname=""),o.search?o.search.charAt(0)!=="?"&&(o.search="?"+o.search):o.search="",o.hash?o.hash.charAt(0)!=="#"&&(o.hash="#"+o.hash):o.hash="",t!==void 0&&o.state===void 0&&(o.state=t));try{o.pathname=decodeURI(o.pathname)}catch(i){throw i instanceof URIError?new URIError('Pathname "'+o.pathname+'" could not be decoded. This is likely caused by an invalid percent-encoding.'):i}return r&&(o.key=r),e?o.pathname?o.pathname.charAt(0)!=="/"&&(o.pathname=At(o.pathname,e.pathname)):o.pathname=e.pathname:o.pathname||(o.pathname="/"),o}function Ot(n,t){return n.pathname===t.pathname&&n.search===t.search&&n.hash===t.hash&&n.key===t.key&&cn(n.state,t.state)}function wn(){var n=null;function t(a){return n=a,function(){n===a&&(n=null)}}function r(a,u,s,c){if(n!=null){var f=typeof n=="function"?n(a,u):n;typeof f=="string"?typeof s=="function"?s(f,c):c(!0):c(f!==!1)}else c(!0)}var e=[];function o(a){var u=!0;function s(){u&&a.apply(void 0,arguments)}return e.push(s),function(){u=!1,e=e.filter(function(c){return c!==s})}}function i(){for(var a=arguments.length,u=new Array(a),s=0;s<a;s++)u[s]=arguments[s];e.forEach(function(c){return c.apply(void 0,u)})}return{setPrompt:t,confirmTransitionTo:r,appendListener:o,notifyListeners:i}}var $n=!!(typeof window<"u"&&window.document&&window.document.createElement);function Fn(n,t){t(window.confirm(n))}function Tt(){var n=window.navigator.userAgent;return(n.indexOf("Android 2.")!==-1||n.indexOf("Android 4.0")!==-1)&&n.indexOf("Mobile Safari")!==-1&&n.indexOf("Chrome")===-1&&n.indexOf("Windows Phone")===-1?!1:window.history&&"pushState"in window.history}function Lt(){return window.navigator.userAgent.indexOf("Trident")===-1}function _t(){return window.navigator.userAgent.indexOf("Firefox")===-1}function Ut(n){return n.state===void 0&&navigator.userAgent.indexOf("CriOS")===-1}var Wn="popstate",Vn="hashchange";function qn(){try{return window.history.state||{}}catch{return{}}}function St(n){n===void 0&&(n={}),$n||J(!1);var t=window.history,r=Tt(),e=!Lt(),o=n,i=o.forceRefresh,a=i===void 0?!1:i,u=o.getUserConfirmation,s=u===void 0?Fn:u,c=o.keyLength,f=c===void 0?6:c,l=n.basename?Bn(en(n.basename)):"";function p(d){var h=d||{},g=h.key,m=h.state,b=window.location,_=b.pathname,$=b.search,D=b.hash,W=_+$+D;return l&&(W=Nn(W,l)),U(W,m,g)}function v(){return Math.random().toString(36).substr(2,f)}var x=wn();function C(d){V(F,d),F.length=t.length,x.notifyListeners(F.location,F.action)}function O(d){Ut(d)||I(p(d.state))}function P(){I(p(qn()))}var L=!1;function I(d){if(L)L=!1,C();else{var h="POP";x.confirmTransitionTo(d,h,s,function(g){g?C({action:h,location:d}):H(d)})}}function H(d){var h=F.location,g=A.indexOf(h.key);g===-1&&(g=0);var m=A.indexOf(d.key);m===-1&&(m=0);var b=g-m;b&&(L=!0,R(b))}var S=p(qn()),A=[S.key];function y(d){return l+j(d)}function w(d,h){var g="PUSH",m=U(d,h,v(),F.location);x.confirmTransitionTo(m,g,s,function(b){if(b){var _=y(m),$=m.key,D=m.state;if(r)if(t.pushState({key:$,state:D},null,_),a)window.location.href=_;else{var W=A.indexOf(F.location.key),Y=A.slice(0,W+1);Y.push(m.key),A=Y,C({action:g,location:m})}else window.location.href=_}})}function T(d,h){var g="REPLACE",m=U(d,h,v(),F.location);x.confirmTransitionTo(m,g,s,function(b){if(b){var _=y(m),$=m.key,D=m.state;if(r)if(t.replaceState({key:$,state:D},null,_),a)window.location.replace(_);else{var W=A.indexOf(F.location.key);W!==-1&&(A[W]=m.key),C({action:g,location:m})}else window.location.replace(_)}})}function R(d){t.go(d)}function k(){R(-1)}function K(){R(1)}var Q=0;function B(d){Q+=d,Q===1&&d===1?(window.addEventListener(Wn,O),e&&window.addEventListener(Vn,P)):Q===0&&(window.removeEventListener(Wn,O),e&&window.removeEventListener(Vn,P))}var M=!1;function X(d){d===void 0&&(d=!1);var h=x.setPrompt(d);return M||(B(1),M=!0),function(){return M&&(M=!1,B(-1)),h()}}function Un(d){var h=x.appendListener(d);return B(1),function(){B(-1),h()}}var F={length:t.length,action:"POP",location:S,createHref:y,push:w,replace:T,go:R,goBack:k,goForward:K,block:X,listen:Un};return F}var Dn="hashchange",Mt={hashbang:{encodePath:function(n){return n.charAt(0)==="!"?n:"!/"+Hn(n)},decodePath:function(n){return n.charAt(0)==="!"?n.substr(1):n}},noslash:{encodePath:Hn,decodePath:en},slash:{encodePath:en,decodePath:en}};function Jn(n){var t=n.indexOf("#");return t===-1?n:n.slice(0,t)}function rn(){var n=window.location.href,t=n.indexOf("#");return t===-1?"":n.substring(t+1)}function jt(n){window.location.hash=n}function xn(n){window.location.replace(Jn(window.location.href)+"#"+n)}function It(n){n===void 0&&(n={}),$n||J(!1);var t=window.history;_t();var r=n,e=r.getUserConfirmation,o=e===void 0?Fn:e,i=r.hashType,a=i===void 0?"slash":i,u=n.basename?Bn(en(n.basename)):"",s=Mt[a],c=s.encodePath,f=s.decodePath;function l(){var h=f(rn());return u&&(h=Nn(h,u)),U(h)}var p=wn();function v(h){V(d,h),d.length=t.length,p.notifyListeners(d.location,d.action)}var x=!1,C=null;function O(h,g){return h.pathname===g.pathname&&h.search===g.search&&h.hash===g.hash}function P(){var h=rn(),g=c(h);if(h!==g)xn(g);else{var m=l(),b=d.location;if(!x&&O(b,m)||C===j(m))return;C=null,L(m)}}function L(h){if(x)x=!1,v();else{var g="POP";p.confirmTransitionTo(h,g,o,function(m){m?v({action:g,location:h}):I(h)})}}function I(h){var g=d.location,m=y.lastIndexOf(j(g));m===-1&&(m=0);var b=y.lastIndexOf(j(h));b===-1&&(b=0);var _=m-b;_&&(x=!0,k(_))}var H=rn(),S=c(H);H!==S&&xn(S);var A=l(),y=[j(A)];function w(h){var g=document.querySelector("base"),m="";return g&&g.getAttribute("href")&&(m=Jn(window.location.href)),m+"#"+c(u+j(h))}function T(h,g){var m="PUSH",b=U(h,void 0,void 0,d.location);p.confirmTransitionTo(b,m,o,function(_){if(_){var $=j(b),D=c(u+$),W=rn()!==D;if(W){C=$,jt(D);var Y=y.lastIndexOf(j(d.location)),ut=y.slice(0,Y+1);ut.push($),y=ut,v({action:m,location:b})}else v()}})}function R(h,g){var m="REPLACE",b=U(h,void 0,void 0,d.location);p.confirmTransitionTo(b,m,o,function(_){if(_){var $=j(b),D=c(u+$),W=rn()!==D;W&&(C=$,xn(D));var Y=y.indexOf(j(d.location));Y!==-1&&(y[Y]=$),v({action:m,location:b})}})}function k(h){t.go(h)}function K(){k(-1)}function Q(){k(1)}var B=0;function M(h){B+=h,B===1&&h===1?window.addEventListener(Dn,P):B===0&&window.removeEventListener(Dn,P)}var X=!1;function Un(h){h===void 0&&(h=!1);var g=p.setPrompt(h);return X||(M(1),X=!0),function(){return X&&(X=!1,M(-1)),g()}}function F(h){var g=p.appendListener(h);return M(1),function(){M(-1),g()}}var d={length:t.length,action:"POP",location:A,createHref:w,push:T,replace:R,go:k,goBack:K,goForward:Q,block:Un,listen:F};return d}function Kn(n,t,r){return Math.min(Math.max(n,t),r)}function Ht(n){n===void 0&&(n={});var t=n,r=t.getUserConfirmation,e=t.initialEntries,o=e===void 0?["/"]:e,i=t.initialIndex,a=i===void 0?0:i,u=t.keyLength,s=u===void 0?6:u,c=wn();function f(w){V(y,w),y.length=y.entries.length,c.notifyListeners(y.location,y.action)}function l(){return Math.random().toString(36).substr(2,s)}var p=Kn(a,0,o.length-1),v=o.map(function(w){return typeof w=="string"?U(w,void 0,l()):U(w,void 0,w.key||l())}),x=j;function C(w,T){var R="PUSH",k=U(w,T,l(),y.location);c.confirmTransitionTo(k,R,r,function(K){if(K){var Q=y.index,B=Q+1,M=y.entries.slice(0);M.length>B?M.splice(B,M.length-B,k):M.push(k),f({action:R,location:k,index:B,entries:M})}})}function O(w,T){var R="REPLACE",k=U(w,T,l(),y.location);c.confirmTransitionTo(k,R,r,function(K){K&&(y.entries[y.index]=k,f({action:R,location:k}))})}function P(w){var T=Kn(y.index+w,0,y.entries.length-1),R="POP",k=y.entries[T];c.confirmTransitionTo(k,R,r,function(K){K?f({action:R,location:k,index:T}):f()})}function L(){P(-1)}function I(){P(1)}function H(w){var T=y.index+w;return T>=0&&T<y.entries.length}function S(w){return w===void 0&&(w=!1),c.setPrompt(w)}function A(w){return c.appendListener(w)}var y={length:v.length,action:"POP",location:v[p],index:p,entries:v,createHref:x,push:C,replace:O,go:P,goBack:L,goForward:I,canGo:H,block:S,listen:A};return y}const zn=await Sn("react"),{Component:Gn}=zn;var En=1073741823,Qn=typeof globalThis<"u"?globalThis:typeof window<"u"?window:typeof global<"u"?global:{};function Nt(){var n="__global_unique_id__";return Qn[n]=(Qn[n]||0)+1}function Bt(n,t){return n===t?n!==0||1/n===1/t:n!==n&&t!==t}function $t(n){var t=[];return{on:function(r){t.push(r)},off:function(r){t=t.filter(function(e){return e!==r})},get:function(){return n},set:function(r,e){n=r,t.forEach(function(o){return o(n,e)})}}}function Ft(n){return Array.isArray(n)?n[0]:n}function Wt(n,t){var r,e,o="__create-react-context-"+Nt()+"__",i=function(u){z(s,u);function s(){var f;return f=u.apply(this,arguments)||this,f.emitter=$t(f.props.value),f}var c=s.prototype;return c.getChildContext=function(){var f;return f={},f[o]=this.emitter,f},c.componentWillReceiveProps=function(f){if(this.props.value!==f.value){var l=this.props.value,p=f.value,v;Bt(l,p)?v=0:(v=typeof t=="function"?t(l,p):En,v|=0,v!==0&&this.emitter.set(f.value,v))}},c.render=function(){return this.props.children},s}(Gn);i.childContextTypes=(r={},r[o]=ft.object.isRequired,r);var a=function(u){z(s,u);function s(){var f;return f=u.apply(this,arguments)||this,f.state={value:f.getValue()},f.onUpdate=function(l,p){var v=f.observedBits|0;v&p&&f.setState({value:f.getValue()})},f}var c=s.prototype;return c.componentWillReceiveProps=function(f){var l=f.observedBits;this.observedBits=l??En},c.componentDidMount=function(){this.context[o]&&this.context[o].on(this.onUpdate);var f=this.props.observedBits;this.observedBits=f??En},c.componentWillUnmount=function(){this.context[o]&&this.context[o].off(this.onUpdate)},c.getValue=function(){return this.context[o]?this.context[o].get():n},c.render=function(){return Ft(this.props.children)(this.state.value)},s}(Gn);return a.contextTypes=(e={},e[o]=ft.object,e),{Provider:i,Consumer:a}}var Vt=zn.createContext||Wt,Z={exports:{}},qt=Array.isArray||function(n){return Object.prototype.toString.call(n)=="[object Array]"},un=qt;Z.exports=Xn,Z.exports.parse=bn,Z.exports.compile=Jt,Z.exports.tokensToFunction=Yn,Z.exports.tokensToRegExp=Zn;var Dt=new RegExp(["(\\\\.)","([\\/.])?(?:(?:\\:(\\w+)(?:\\(((?:\\\\.|[^\\\\()])+)\\))?|\\(((?:\\\\.|[^\\\\()])+)\\))([+*?])?|(\\*))"].join("|"),"g");function bn(n,t){for(var r=[],e=0,o=0,i="",a=t&&t.delimiter||"/",u;(u=Dt.exec(n))!=null;){var s=u[0],c=u[1],f=u.index;if(i+=n.slice(o,f),o=f+s.length,c){i+=c[1];continue}var l=n[o],p=u[2],v=u[3],x=u[4],C=u[5],O=u[6],P=u[7];i&&(r.push(i),i="");var L=p!=null&&l!=null&&l!==p,I=O==="+"||O==="*",H=O==="?"||O==="*",S=u[2]||a,A=x||C;r.push({name:v||e++,prefix:p||"",delimiter:S,optional:H,repeat:I,partial:L,asterisk:!!P,pattern:A?Gt(A):P?".*":"[^"+sn(S)+"]+?"})}return o<n.length&&(i+=n.substr(o)),i&&r.push(i),r}function Jt(n,t){return Yn(bn(n,t),t)}function Kt(n){return encodeURI(n).replace(/[\/?#]/g,function(t){return"%"+t.charCodeAt(0).toString(16).toUpperCase()})}function zt(n){return encodeURI(n).replace(/[?#]/g,function(t){return"%"+t.charCodeAt(0).toString(16).toUpperCase()})}function Yn(n,t){for(var r=new Array(n.length),e=0;e<n.length;e++)typeof n[e]=="object"&&(r[e]=new RegExp("^(?:"+n[e].pattern+")$",An(t)));return function(o,i){for(var a="",u=o||{},s=i||{},c=s.pretty?Kt:encodeURIComponent,f=0;f<n.length;f++){var l=n[f];if(typeof l=="string"){a+=l;continue}var p=u[l.name],v;if(p==null)if(l.optional){l.partial&&(a+=l.prefix);continue}else throw new TypeError('Expected "'+l.name+'" to be defined');if(un(p)){if(!l.repeat)throw new TypeError('Expected "'+l.name+'" to not repeat, but received `'+JSON.stringify(p)+"`");if(p.length===0){if(l.optional)continue;throw new TypeError('Expected "'+l.name+'" to not be empty')}for(var x=0;x<p.length;x++){if(v=c(p[x]),!r[f].test(v))throw new TypeError('Expected all "'+l.name+'" to match "'+l.pattern+'", but received `'+JSON.stringify(v)+"`");a+=(x===0?l.prefix:l.delimiter)+v}continue}if(v=l.asterisk?zt(p):c(p),!r[f].test(v))throw new TypeError('Expected "'+l.name+'" to match "'+l.pattern+'", but received "'+v+'"');a+=l.prefix+v}return a}}function sn(n){return n.replace(/([.+*?=^!:${}()[\]|\/\\])/g,"\\$1")}function Gt(n){return n.replace(/([=!:$\/()])/g,"\\$1")}function Cn(n,t){return n.keys=t,n}function An(n){return n&&n.sensitive?"":"i"}function Qt(n,t){var r=n.source.match(/\((?!\?)/g);if(r)for(var e=0;e<r.length;e++)t.push({name:e,prefix:null,delimiter:null,optional:!1,repeat:!1,partial:!1,asterisk:!1,pattern:null});return Cn(n,t)}function Yt(n,t,r){for(var e=[],o=0;o<n.length;o++)e.push(Xn(n[o],t,r).source);var i=new RegExp("(?:"+e.join("|")+")",An(r));return Cn(i,t)}function Zt(n,t,r){return Zn(bn(n,r),t,r)}function Zn(n,t,r){un(t)||(r=t||r,t=[]),r=r||{};for(var e=r.strict,o=r.end!==!1,i="",a=0;a<n.length;a++){var u=n[a];if(typeof u=="string")i+=sn(u);else{var s=sn(u.prefix),c="(?:"+u.pattern+")";t.push(u),u.repeat&&(c+="(?:"+s+c+")*"),u.optional?u.partial?c=s+"("+c+")?":c="(?:"+s+"("+c+"))?":c=s+"("+c+")",i+=c}}var f=sn(r.delimiter||"/"),l=i.slice(-f.length)===f;return e||(i=(l?i.slice(0,-f.length):i)+"(?:"+f+"(?=$))?"),o?i+="$":i+=e&&l?"":"(?="+f+"|$)",Cn(new RegExp("^"+i,An(r)),t)}function Xn(n,t,r){return un(t)||(r=t||r,t=[]),r=r||{},n instanceof RegExp?Qt(n,t):un(n)?Yt(n,t,r):Zt(n,t,r)}var Xt=Z.exports;const nt=pe(Xt),E=await Sn("react");let Pn,Rn,N,kn;Pn=function(n){var t=Vt();return t.displayName=n,t},Rn=Pn("Router-History"),N=Pn("Router"),nn=function(n){z(t,n),t.computeRootMatch=function(e){return{path:"/",url:"/",params:{},isExact:e==="/"}};function t(e){var o;return o=n.call(this,e)||this,o.state={location:e.history.location},o._isMounted=!1,o._pendingLocation=null,e.staticContext||(o.unlisten=e.history.listen(function(i){o._isMounted?o.setState({location:i}):o._pendingLocation=i})),o}var r=t.prototype;return r.componentDidMount=function(){this._isMounted=!0,this._pendingLocation&&this.setState({location:this._pendingLocation})},r.componentWillUnmount=function(){this.unlisten&&(this.unlisten(),this._isMounted=!1,this._pendingLocation=null)},r.render=function(){return E.createElement(N.Provider,{value:{history:this.props.history,location:this.state.location,match:t.computeRootMatch(this.state.location.pathname),staticContext:this.props.staticContext}},E.createElement(Rn.Provider,{children:this.props.children||null,value:this.props.history}))},t}(E.Component),ht=function(n){z(t,n);function t(){for(var e,o=arguments.length,i=new Array(o),a=0;a<o;a++)i[a]=arguments[a];return e=n.call.apply(n,[this].concat(i))||this,e.history=Ht(e.props),e}var r=t.prototype;return r.render=function(){return E.createElement(nn,{history:this.history,children:this.props.children})},t}(E.Component),kn=function(n){z(t,n);function t(){return n.apply(this,arguments)||this}var r=t.prototype;return r.componentDidMount=function(){this.props.onMount&&this.props.onMount.call(this,this)},r.componentDidUpdate=function(e){this.props.onUpdate&&this.props.onUpdate.call(this,this,e)},r.componentWillUnmount=function(){this.props.onUnmount&&this.props.onUnmount.call(this,this)},r.render=function(){return null},t}(E.Component),dt=function(n){var t=n.message,r=n.when,e=r===void 0?!0:r;return E.createElement(N.Consumer,null,function(o){if(o||J(!1),!e||o.staticContext)return null;var i=o.history.block;return E.createElement(kn,{onMount:function(a){a.release=i(t)},onUpdate:function(a,u){u.message!==t&&(a.release(),a.release=i(t))},onUnmount:function(a){a.release()},message:t})})};var On={},ne=1e4,tt=0;function te(n){if(On[n])return On[n];var t=nt.compile(n);return tt<ne&&(On[n]=t,tt++),t}dn=function(n,t){return n===void 0&&(n="/"),t===void 0&&(t={}),n==="/"?n:te(n)(t,{pretty:!0})},mt=function(n){var t=n.computedMatch,r=n.to,e=n.push,o=e===void 0?!1:e;return E.createElement(N.Consumer,null,function(i){i||J(!1);var a=i.history,u=i.staticContext,s=o?a.push:a.replace,c=U(t?typeof r=="string"?dn(r,t.params):V({},r,{pathname:dn(r.pathname,t.params)}):r);return u?(s(c),null):E.createElement(kn,{onMount:function(){s(c)},onUpdate:function(f,l){var p=U(l.to);Ot(p,V({},c,{key:p.key}))||s(c)},to:r})})};var et={},ee=1e4,rt=0;function re(n,t){var r=""+t.end+t.strict+t.sensitive,e=et[r]||(et[r]={});if(e[n])return e[n];var o=[],i=nt(n,o,t),a={regexp:i,keys:o};return rt<ee&&(e[n]=a,rt++),a}tn=function(n,t){t===void 0&&(t={}),(typeof t=="string"||Array.isArray(t))&&(t={path:t});var r=t,e=r.path,o=r.exact,i=o===void 0?!1:o,a=r.strict,u=a===void 0?!1:a,s=r.sensitive,c=s===void 0?!1:s,f=[].concat(e);return f.reduce(function(l,p){if(!p&&p!=="")return null;if(l)return l;var v=re(p,{end:i,strict:u,sensitive:c}),x=v.regexp,C=v.keys,O=x.exec(n);if(!O)return null;var P=O[0],L=O.slice(1),I=n===P;return i&&!I?null:{path:p,url:p==="/"&&P===""?"/":P,isExact:I,params:C.reduce(function(H,S,A){return H[S.name]=L[A],H},{})}},null)};function oe(n){return E.Children.count(n)===0}yt=function(n){z(t,n);function t(){return n.apply(this,arguments)||this}var r=t.prototype;return r.render=function(){var e=this;return E.createElement(N.Consumer,null,function(o){o||J(!1);var i=e.props.location||o.location,a=e.props.computedMatch?e.props.computedMatch:e.props.path?tn(i.pathname,e.props):o.match,u=V({},o,{location:i,match:a}),s=e.props,c=s.children,f=s.component,l=s.render;return Array.isArray(c)&&oe(c)&&(c=null),E.createElement(N.Provider,{value:u},u.match?c?typeof c=="function"?c(u):c:f?E.createElement(f,u):l?l(u):null:typeof c=="function"?c(u):null)})},t}(E.Component);function Tn(n){return n.charAt(0)==="/"?n:"/"+n}function ie(n,t){return n?V({},t,{pathname:Tn(n)+t.pathname}):t}function ae(n,t){if(!n)return t;var r=Tn(n);return t.pathname.indexOf(r)!==0?t:V({},t,{pathname:t.pathname.substr(r.length)})}function ot(n){return typeof n=="string"?n:j(n)}function Ln(n){return function(){J(!1)}}function it(){}gt=function(n){z(t,n);function t(){for(var e,o=arguments.length,i=new Array(o),a=0;a<o;a++)i[a]=arguments[a];return e=n.call.apply(n,[this].concat(i))||this,e.handlePush=function(u){return e.navigateTo(u,"PUSH")},e.handleReplace=function(u){return e.navigateTo(u,"REPLACE")},e.handleListen=function(){return it},e.handleBlock=function(){return it},e}var r=t.prototype;return r.navigateTo=function(e,o){var i=this.props,a=i.basename,u=a===void 0?"":a,s=i.context,c=s===void 0?{}:s;c.action=o,c.location=ie(u,U(e)),c.url=ot(c.location)},r.render=function(){var e=this.props,o=e.basename,i=o===void 0?"":o,a=e.context,u=a===void 0?{}:a,s=e.location,c=s===void 0?"/":s,f=st(e,["basename","context","location"]),l={createHref:function(p){return Tn(i+ot(p))},action:"POP",location:ae(i,U(c)),push:this.handlePush,replace:this.handleReplace,go:Ln(),goBack:Ln(),goForward:Ln(),listen:this.handleListen,block:this.handleBlock};return E.createElement(nn,V({},f,{history:l,staticContext:u}))},t}(E.Component),wt=function(n){z(t,n);function t(){return n.apply(this,arguments)||this}var r=t.prototype;return r.render=function(){var e=this;return E.createElement(N.Consumer,null,function(o){o||J(!1);var i=e.props.location||o.location,a,u;return E.Children.forEach(e.props.children,function(s){if(u==null&&E.isValidElement(s)){a=s;var c=s.props.path||s.props.from;u=c?tn(i.pathname,V({},s.props,{path:c})):o.match}}),u?E.cloneElement(a,{location:i,computedMatch:u}):null})},t}(E.Component),Ct=function(n){var t="withRouter("+(n.displayName||n.name)+")",r=function(e){var o=e.wrappedComponentRef,i=st(e,["wrappedComponentRef"]);return E.createElement(N.Consumer,null,function(a){return a||J(!1),E.createElement(n,V({},i,a,{ref:o}))})};return r.displayName=t,r.WrappedComponent=n,fe(r,n)};var fn=E.useContext;xt=function(){return fn(Rn)},jn=function(){return fn(N).location},Et=function(){var n=fn(N).match;return n?n.params:{}},bt=function(n){var t=jn(),r=fn(N).match;return n?tn(t.pathname,n):r};function at(n,t){n.prototype=Object.create(t.prototype),n.prototype.constructor=n,le(n,t)}const q=await Sn("react");let ln,pn,hn,G;lt=function(n){at(t,n);function t(){for(var e,o=arguments.length,i=new Array(o),a=0;a<o;a++)i[a]=arguments[a];return e=n.call.apply(n,[this].concat(i))||this,e.history=St(e.props),e}var r=t.prototype;return r.render=function(){return q.createElement(nn,{history:this.history,children:this.props.children})},t}(q.Component),pt=function(n){at(t,n);function t(){for(var e,o=arguments.length,i=new Array(o),a=0;a<o;a++)i[a]=arguments[a];return e=n.call.apply(n,[this].concat(i))||this,e.history=It(e.props),e}var r=t.prototype;return r.render=function(){return q.createElement(nn,{history:this.history,children:this.props.children})},t}(q.Component),ln=function(n,t){return typeof n=="function"?n(t):n},pn=function(n,t){return typeof n=="string"?U(n,null,null,t):n},hn=function(n){return n},G=q.forwardRef,typeof G>"u"&&(G=hn);function ce(n){return!!(n.metaKey||n.altKey||n.ctrlKey||n.shiftKey)}let ct,_n,on;ct=G(function(n,t){var r=n.innerRef,e=n.navigate,o=n.onClick,i=mn(n,["innerRef","navigate","onClick"]),a=i.target,u=vn({},i,{onClick:function(s){try{o&&o(s)}catch(c){throw s.preventDefault(),c}!s.defaultPrevented&&s.button===0&&(!a||a==="_self")&&!ce(s)&&(s.preventDefault(),e())}});return hn!==G?u.ref=t||r:u.ref=r,q.createElement("a",u)}),Mn=G(function(n,t){var r=n.component,e=r===void 0?ct:r,o=n.replace,i=n.to,a=n.innerRef,u=mn(n,["component","replace","to","innerRef"]);return q.createElement(N.Consumer,null,function(s){s||J(!1);var c=s.history,f=pn(ln(i,s.location),s.location),l=f?c.createHref(f):"",p=vn({},u,{href:l,navigate:function(){var v=ln(i,s.location),x=j(s.location)===j(pn(v)),C=o||x?c.replace:c.push;C(v)}});return hn!==G?p.ref=t||a:p.innerRef=a,q.createElement(e,p)})}),_n=function(n){return n},on=q.forwardRef,typeof on>"u"&&(on=_n);function ue(){for(var n=arguments.length,t=new Array(n),r=0;r<n;r++)t[r]=arguments[r];return t.filter(function(e){return e}).join(" ")}vt=on(function(n,t){var r=n["aria-current"],e=r===void 0?"page":r,o=n.activeClassName,i=o===void 0?"active":o,a=n.activeStyle,u=n.className,s=n.exact,c=n.isActive,f=n.location,l=n.sensitive,p=n.strict,v=n.style,x=n.to,C=n.innerRef,O=mn(n,["aria-current","activeClassName","activeStyle","className","exact","isActive","location","sensitive","strict","style","to","innerRef"]);return q.createElement(N.Consumer,null,function(P){P||J(!1);var L=f||P.location,I=pn(ln(x,L),L),H=I.pathname,S=H&&H.replace(/([.+*?=^!:${}()[\]|/\\])/g,"\\$1"),A=S?tn(L.pathname,{path:S,exact:s,sensitive:l,strict:p}):null,y=!!(c?c(A,L):A),w=typeof u=="function"?u(y):u,T=typeof v=="function"?v(y):v;y&&(w=ue(w,i),T=vn({},T,a));var R=vn({"aria-current":y&&e||null,className:w,style:T,to:I},O);return _n!==on?R.ref=t||C:R.innerRef=C,q.createElement(Mn,R)})})});export{lt as BrowserRouter,pt as HashRouter,Mn as Link,ht as MemoryRouter,vt as NavLink,dt as Prompt,mt as Redirect,yt as Route,nn as Router,gt as StaticRouter,wt as Switch,he as __tla,dn as generatePath,tn as matchPath,xt as useHistory,jn as useLocation,Et as useParams,bt as useRouteMatch,Ct as withRouter};