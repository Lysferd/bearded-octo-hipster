# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#$ ->
  #layoutx1 = "<?xml version='1.0' encoding='utf-8' ?><Layout xmlns='urn:VideoLayoutSchema' Name='1x1' Rows='1' Columns='1' AspectRatio=':3'><Pane Id='0' RowSpan='1' ColumnSpan='1' RowNumber='0' ColumnNumber='0' IsMasterPane='true' /></Layout>"
  #AxVideoControl.SetPaneLayout(layoutx1)

  ###
  #recorder = recorder_factory.CreateVideoEdgeNvr1('201.64.223.')

  $("#contents button#live").click ->
    # change to live view
    #alert(this)
    $("#contents div#video_object").hide()

  $("#contents button#playback").click ->
    # change to playback view

    // Create nvr recorder
    var recorder = recorderFactory.CreateVideoEdgeNvr1(_unitAddress.value, _userName.value, _password.value);
    if (recorder == null) {
    alert("Failed to create recorder!");
      return;
    }

    // Get IPtz interface from recorder
    IPtzControl = recorder.GetInterface("ADSDK.IPtz");
    ptzCamera = _cameraNumber.value;

    if (IPtzControl != null) {
      // Start the session
      var result = ResultCode_Success;
      result = IPtzControl.StartSession(ptzCamera);
      if (result != ResultCode_Success) {
      alert("Failed to start PTZ session. The camera may not support PTZ.ErrorCode:" + mapResultCode.get(result));
        _disablePtzControl(true);
        return;
      }
    }

    StopSession.disabled = false;
    StartSession.disabled = true;
    ###