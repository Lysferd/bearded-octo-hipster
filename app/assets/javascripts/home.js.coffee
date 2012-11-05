# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# TODO: remove these plain text references
user = 'admin'
pass = 'VIDEO!edge23'
address = '192.168.1.106'

pane_layout = "<?xml version='1.0' encoding='utf-8' ?>
               <Layout xmlns='urn:VideoLayoutSchema'
               Name='1x2' Rows='1' Columns='1' AspectRatio='4:3'>
               <Pane Id='0' RowSpan='1' ColumnSpan='1' RowNumber='0'
               ColumnNumber='0' IsMasterPane='true' />
               <Pane Id='1' RowSpan='1' ColumnSpan='2' RowNumber='0'
               ColumnNumber='1' IsMaterPane='false' />
               </Layout>"

generate_uri = ( camera_id = 0 ) -> "nvr://#{user}:#{pass}@#{address#}/media/#{camera_id}/video/0/"

$ ->
  qtObj.innerHTML = "<object classid='clsid:37BEA57F-131B-49C1-B6FB-6D9E78F41B19'
    height=480 width=640
    id='_iVideoControl' EnableJavaScript='true'
    codebase='ADSDK.IVideoControl'></object>"

  header.innerHTML = "<h1>Video Server 3</h1>
    <h3>URI: #{generate_uri()}</h3>"

@startButton_onclick = ->
  try
    _iVideoControl.SetPaneLayout pane_layout
    _iVideoControl.MediaStreamStopAll
    #_iVideoControl.MediaStreamRender 0, generate_uri( 0 )
    _iVideoControl.MediaStreamRender 0, generate_uri( 1 )

    streaming = _iVideoControl.GetInterface( 'ADSDK.IStreaming' )
    #streaming.StreamingStartFrom

    # The following undos the panels' width and height properties,
    # hence has been commented.
    #_iVideoControl.resize()
  catch error
    alert error

