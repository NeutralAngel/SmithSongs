# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  init()

$(document).on "pjax:complete", ->
  init()

init = ->
  
  $("#event_event_date").datepicker
      dateFormat: 'yy-mm-dd'
      showButtonPanel: true

      onSelect: ->
        (if document.all then $(this).get(0).fireEvent("onchange") else $(this).change())
        @focus()

      onClose: (dateText, inst) ->
        @select()  unless document.all

  title = $('title').text() 
  $('title').remove()

  title = "NewEvent"  if title is "New Event"

  $('a').removeClass('active')
  
  $("#" + title).addClass "active"

  # $("#makeMeScrollable").smoothDivScroll("destroy");

  $("#makeMeScrollable").smoothDivScroll
    mousewheelScrolling: "allDirections"
    manualContinuousScrolling: true
    autoScrollingMode: "onStart"
    touchscrolling: "true"

  $("#makeMeScrollable").smoothDivScroll("resetEverything");




