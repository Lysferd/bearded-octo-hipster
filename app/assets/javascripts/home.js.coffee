# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$(document).ready ->
  $("contents").ready ->
    $(this).remove()

###
`
function setStyle() {
  window.alert("Teste");
  document.getElementById("test").style.borderWidth = '5px';
  document.getElementById("test").style.borderStyle = 'Solid';
}
`
###