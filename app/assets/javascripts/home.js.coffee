# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  alert('teste')
  recorder_factory = new ActiveXObject("ADSDK.RecorderFactory")
  alert(recorder_factory)
  if recorder_factory
    alert("Successfully created RecorderFactory object!")
  else
    alert("Error when creating RecorderFactory object!")
  #recorder = recorder_factory.CreateVideoEdgeNvr1('201.64.223.')

  $("#contents button#live").click ->
    # change to live view
    #alert(this)
    $("#contents div#video_object").hide()

  $("#contents button#playback").click ->
    # change to playback view
    ###
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