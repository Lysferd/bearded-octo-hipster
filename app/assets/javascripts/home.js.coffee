# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

@popitup = ->
  newwindow = window.open('instructions.htm', 'Plugin Installation Instructions', 'height=400,width=300')
  newwindow.focus if window.focus