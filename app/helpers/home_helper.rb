module HomeHelper
  def live?
    params[:session] == 'live'
  end

  def playback?
    params[:session] == 'playback'
  end
end
