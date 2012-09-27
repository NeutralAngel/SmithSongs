# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  
  playlist = $('#music').data('music')
  cssSelector =
    jPlayer: "#jquery_jplayer_1"
    cssSelectorAncestor: "#jp_container_1"

  options =
    swfPath: "/"
    supplied: "mp3"
    solution: "html, flash"

  myPlaylist = new jPlayerPlaylist(cssSelector, playlist, options)

  $("a:not([data-remote]):not([data-behavior]):not([data-skip-pjax])").pjax "[data-pjax-container]"


 