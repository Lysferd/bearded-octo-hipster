# Encoding: UTF-8

class HomeController < ApplicationController
  require 'open-uri'

  # FIXME: Define proper URI for authentication filepath.
  UNISOLUTION_PATH = 'http://someurl.com.br/'

  skip_before_filter :check_browser, only: [:error_406, :index]
  skip_before_filter :authorize
  before_filter :check_for_parameters, except: [:error_406, :error_401, :index]

  def check_for_parameters
    if params[:u] && params[:token] && params[:w]
      Warehouse::all.each { |warehouse| @warehouse = warehouse if /#{params[:w]}/i =~ warehouse.label }
      authenticate!(params[:u], params[:token])
    else
      redirect_to login_path
    end
  end

  #------------------------------------------------------------------------------------------------------------------
  # * Authenticate against Unisolution's server (INCOMPLETE)
  #----------------------------------------------------------
  #  Being a public application with no kind of HTTP Authentication whatsoever, there is a need to authenticate
  # against the website from where the users will come from, to make sure those who are browsing this application
  # have successfully logged onto theirs. Above all, this is for security measures since this application shall be a
  # hub of potential security cameras.
  #  This authentication method is custom. By receiving a total of 3 (three) URL parameters, this application is
  # capable of distinguishing which warehouse it is desired to browse, who is the user who's browsing and a security
  # token will provide the means to ascertain the veracity of the user's identity. From these, the warehouse
  # parameter is the only one unrelated to the authentication system, although it is required for the rest of this
  # application's proper operation.
  #  Unisolution's server will have a (basic) HTTP Authentication-protected folder (FTP?) containing a plaintext file
  # for every user currently logged in their system (valid as long as their cookies). The filename will be the name
  # as the username, and its contents will be only the token. Both, given to this application through URL parameters.
  # If the received parameters match the live contents in their server, authorization is successful.
  #  [!] Any other scope of user validation will be Unisolution's responsibility.
  #------------------------------------------------------------------------------------------------------------------
  # @param [String] username
  # @param [String] token
  def authenticate!(username, token)

    # HACK: Dismiss authentication check and progress (DEBUG ONLY).
    return true if params[:u] == 'ib' and params[:token] == 'ibtech'

    # FIXME: Username/password pair for HTTP Authentication lacking.
    # REVIEW: Use plaintext files without extensions.
    open(UNISOLUTION_PATH + username) do |file|
      redirect_to error_401_path if (file.readlines.select { |line| line == token }).empty?
    end
  end

  #------------------------------------------------------------------------------------------------------------------
  # * Obtain authentication tokens from VideoEdge server (4.2 ONLY)
  #-----------------------------------------------------------------
  #  The VideoEdge 4.2 features a new functionality which is a security token, given as parameter to the QuickTime
  # object in order to play RTSP streaming without manually inputting username/password authentication data.
  # This is slightly insecure since the token is stored in a plaintext-like file in the server, although the latter
  # is protected by (basic) HTTP Authentication methods.
  #  A known issue is the fact that the token is a randomly-generated MD5 Hash, which means each refresh is a new
  # key. This can be problematic since each camera seems to have its own token generation algorithm. Maybe rather
  # than executing this procedure at page load, it should be executed right before stream connection? However, this
  # approach is impossible via the server-side Ruby programming. Meaning, it would have to be something along the
  # lines of JavaScript or VBScript (since possible). That would be a terrible security breach though, and should be
  # avoided. Last resort shall be storing the tokens of every camera possible for every server of the selected
  # warehouse in a huge Hash object, since even though that sounds ugly (it could easily have 100+ elements), it is
  # the most secure approach.
  #------------------------------------------------------------------------------------------------------------------
  def get_tokens
    @tokens = {}
    @warehouse.servers.each do |server|
      # REVIEW: does 0 work in all cases?
      #server.cameras.each
      #for i in 0...10 do
      uri = "http://#{server.address}:#{server.admin_port}/video/cam_details/0/"
      open(uri, :http_basic_authentication => [server.username, server.password]) do |file|
        /"auth_token": "(?<token>[\d\w-]+)"/ =~ file.readlines.join
        @tokens[server.id] = token
      end
      #end
    end
  end

  def index
    params[:session] ||= 'live'
  end

  def live
  end

  def playback
  end

  def error_401
  end

  def error_406
  end
end
