# Encoding: UTF-8

class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :check_browser, :check_for_user, :authorize

  protected
  def check_browser
    #redirect_to error_406_path if request.env['HTTP_USER_AGENT'] and not request.env['HTTP_USER_AGENT'][/msie/i]
  end

  def check_for_user
    redirect_to new_user_path, notice: 'Nao foram encontrados usuarios.' if User::all.empty?
  end

  def authorize
    if not User::all.empty? and not User::find_by_id(session[:user_id])
      redirect_to login_url, notice: 'A página exige privilégios administrativos.'
    end
  end
end
