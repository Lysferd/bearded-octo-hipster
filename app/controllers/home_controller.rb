# Encoding: UTF-8

class HomeController < ApplicationController

  UNISOLUTION_PATH = 'http://' #define a path to the authenticated file

  require 'open-uri'

  skip_before_filter :check_browser, only: :error
  skip_before_filter :authorize
  before_filter :check_for_parameters, except: :error

  def index
  end

  def live
  end

  def playback
  end

  def error
  end

  def check_for_parameters
    # Check for Username and Token parameters.
    #authenticate!( params[:u], params[:token] )
    @test = params[:t]

    # Check for Warehouse parameter.
    if params[:w] =~ /\d+/
      @warehouse = Warehouse::find_by_id(params[:w].to_i)

      # deprecated: getting a warehouse by id is a deprecated functionality.
    elsif not params[:w].nil?
      Warehouse::all.each do |warehouse|
        @warehouse = warehouse if /#{params[:w]}/i =~ warehouse.label
      end
    else
      redirect_to login_path
    end
  end

  def authenticate!(username, token)
    fail ArgumentError unless params[:u] && params[:token]

    # fixme: debug only
    return true if params[:u] == 'ib' and params[:token] == 'ibtech'

    # fixme: username/password?
    # fixme: prefer plain text files
    open(URI::parse UNISOLUTION_PATH + username + '.xml') do |file|
      fail ArgumentError if (file.readlines.select { |line| line == token }).empty?
    end
  rescue ArgumentError
    redirect_to login_path
  end
end
