// ==UserScript==
// @name          link-unredirect
// @namespace     http://github.com/baohaojun/system-config
// @description   Script for unredirecting google search results
// @include       *.google.*
// ==/UserScript==

var redirect_re = new RegExp(".*//.*google.co.*&url=([^&]*)(&.*|$)");

for (var x in document.links) {
  if (document.links[x].onmousedown) {
    document.links[x].onmousedown="";
  }

  if (document.links[x].href.match(/^http:\/\/developer.android.com\//)) {
    document.links[x].href = document.links[x].href.replace(/^http:/, 'https:');
  }
}
