class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :check_browser, :authorize

  protected
  def check_browser
    #redirect_to error_path if request.env['HTTP_USER_AGENT'] and not request.env['HTTP_USER_AGENT'][/msie/i]
  end

  def authorize
    #redirect_to login_url, notice: 'Please log in' unless User::find_by_id(session[:user_id])
  end
end
