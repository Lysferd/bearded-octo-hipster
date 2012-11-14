class HomeController < ApplicationController

  def index
    @warehouses = Warehouse::all rescue nil
    @servers = Server::all rescue nil
    @cameras = Camera::all rescue nil
  end

  def live
  end

  def playback
  end

end
