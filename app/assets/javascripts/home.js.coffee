# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $("#contents button#live").click ->
    # change to live view
    #alert(this)
    $("#contents div#video_object").hide()

  $("#contents button#playback").click ->
    # change to playback view
