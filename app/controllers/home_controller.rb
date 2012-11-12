class HomeController < ApplicationController

  # Array of Tokens containing possible grid arranges.
  LAYOUTS = %w( 1x1 1x2 2x2 3x3 4x4 8x8 )

  #GENERATE_URI = ->( camera_index = 0 ) { "nvr://#@username:#@password@#@address/media/#{camera_index}/video/0/" }

  def index
  end

  def live
  end

  def playback
  end

end
