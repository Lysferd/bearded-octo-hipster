= Video Server 3 =

 What?
A Ruby on Rails application that uses American Dynamics' SDK to connect to the
Video Edge NVR.

 Why?
There was a need of a web-based application capable of showing live stream, PTZ
control and playback recorded video.

 How?
On the server side, Rails handles information data and rearranges that data for
the VBScripts on the client side, that connects to the Video Edge NVR by means
of the DLLs from the ADSDK, through ActiveX.

 Who?
This application is a necessity of IB Technology.
The SDK is developed by American Dynamics / Tyco.

 All rights reserved?
This web application makes use of little, tiny bits of VBScript to access DLL
functionality. Though the DLLs themselves are needed and have to be present.
Which means the final version of this web application is going to install
a closed-source SDK on the client's computer. Can't help it.

 Internet Explorer Only
Unfortunately. Because it is required to have VBScript, and VBScript only works
on IE.