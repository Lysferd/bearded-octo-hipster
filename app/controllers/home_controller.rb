class HomeController < ApplicationController

  skip_before_filter :check_browser, only: :error
  skip_before_filter :authorize

  def index
  end

  def live
    @pane_layout = "<?xml version='1.0' encoding='utf-8' ?><Layout xmlns='urn:VideoLayoutSchema' Name='1x1' Rows='1' Columns='1' AspectRatio='4:3'><Pane Id='0' RowSpan='1' ColumnSpan='1' RowNumber='0' ColumnNumber='0' IsMasterPane='true'/></Layout>"
  end

  def playback
  end

  def error
  end

end
