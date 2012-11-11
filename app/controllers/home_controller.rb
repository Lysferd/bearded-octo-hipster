class HomeController < ApplicationController

  # Array of Tokens containing possible grid arranges.
  LAYOUTS = %w( 1x1 1x2 2x2 3x3 4x4 8x8 )

  #GENERATE_URI = ->( camera_index = 0 ) { "nvr://#@username:#@password@#@address/media/#{camera_index}/video/0/" }

  def live
    # -=-=-=-=-
    # * Pane Layout
    # This property describes the video panes' scheme, using a XML-like format.
    #@pane_layout = generate_layout( LAYOUTS[1] )

    # -=-=-=-=-
    # * Table Width and Height
    # These two properties describe the video panels table's width and height.
    # TODO: check the possibility of calculating it from the screen's width and height values.
    @width = 640
    @height = 480

    # -=-=-=-=-
    # * Server Authorization
    # The following properties describe how the application shall connect to the
    # NVR server.
    # TODO: remove these plain text references and get them from the database.
  end


end
