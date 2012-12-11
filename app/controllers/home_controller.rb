class HomeController < ApplicationController

  skip_before_filter :check_browser, only: :error
  skip_before_filter :authorize

  def index
    check_for_parameter
  end

  def live
    check_for_parameter
  end

  def playback
    check_for_parameter
  end

  def error
  end

  def check_for_parameter
    if params[:w]
      @warehouse = Warehouse::find_by_id params[:w]
    else
      redirect_to login_path
    end
  end

end
