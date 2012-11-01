# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  qt = "<object classid='clsid:37BEA57F-131B-49C1-B6FB-6D9E78F41B19'" +
  " height=" + 480 + " width=" + 640 +
  " id='_iVideoControl' EnableJavaScript='true'" +
  " codebase='ADSDK.IVideoControl#Version=1.0'></object>"
  document.getElementById( 'qtObj' ).innerHTML = qt

@startButton_onclick = ->
  recorder_factory = loadActiveX( 'ADSDK.IRecorderFactory' )
  alert recorder_factory

