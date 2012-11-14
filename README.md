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

 Database Structure
Because of inherent issues of the ADSDK, there is simple functionality that
cannot be used, like calling IRecorder#GetCamerasList. Instead, annoying
database structures have to be used as replacement.
`+' is used to introduce a new table.
Tabulation represents inheritance.

 + Warehouse
  Represents a congregation of servers.
  String @label: warehouse's name.
  Array @servers: object reference to its inherited servers.
    + Server
     Represents a VideoEdge NVR.
     String @label: server's name.
     String @address: server's TCP/IPv4 address.
     String @username: server's authorization username.
     String @password (digest): server's authorization password.
     Array @cameras: object reference to its inherited cameras.
        + Camera
         String @label: camera's name.
         Integer @camera_id: camera's real index number, relative to the real
                             server (this is just an interface, after all).
 + User
  Represents an administrator authorized to make changes on the application's
  data structure via browser.
  String @username: authorization username.
  String (digest) @password: authorization password.