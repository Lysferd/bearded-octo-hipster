# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

layout = "<?xml version='1.0' encoding='utf-8' ?>
  <Layout xmlns='urn:VideoLayoutSchema' Name='1x1'
  Rows='1'
  Columns='1'
  AspectRatio='4:3'>
  <Pane Id='0'
  RowSpan='1'
  ColumnSpan='1'
  RowNumber='0'
  ColumnNumber='0'
  IsMasterPane='true'/>
  </Layout>"

# -=-=-=-=-
# * Start streaming.
#$ -> setTimeout(render_stream, 0)

render_stream = ->
  try
    _iVideoControl.SetPaneLayout(layout)
    _iVideoControl.MediaStreamStop(0)
    #_iVideoControl.MediaStreamRender(0, "nvr://admin:VIDEO!edge23@192.168.1.106/media/1/video/0/")
    #iStreaming = _iVideoControl.GetInterface('ADSDK.IStreaming')
    #_iVideoControl.Resize
  catch exception
    alert exception
