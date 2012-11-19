class HomeController < ApplicationController

  skip_before_filter :check_browser, only: :error
  skip_before_filter :authorize

  LAYOUTS = {
      '1' => "<?xml version='1.0' encoding='utf-8' ?><Layout xmlns='urn:VideoLayoutSchema' Name='1x1' Rows='1' Columns='1' AspectRatio='4:3'><Pane Id='0' RowSpan='1' ColumnSpan='1' RowNumber='0' ColumnNumber='0' IsMasterPane='true'/></Layout>",
      '2' => "<?xml version='1.0' encoding='utf-8' ?><Layout xmlns='urn:VideoLayoutSchema' Name='1x2' Rows='2' Columns='2' AspectRatio='4:3'><Pane Id='0' RowSpan='1' ColumnSpan='1' RowNumber='0' ColumnNumber='0' IsMasterPane='true'/><Pane Id='1' RowSpan='1' ColumnSpan='2' RowNumber='0' ColumnNumber='1' IsMasterPane='false'/></Layout>",
      '4' => "<?xml version='1.0' encoding='utf-8' ?><Layout xmlns='urn:VideoLayoutSchema' Name='2x2' Rows='2' Columns='2' AspectRatio='4:3'><Pane Id='0' RowSpan='1' ColumnSpan='1' RowNumber='0' ColumnNumber='0' IsMasterPane='true'/><Pane Id='1' RowSpan='1' ColumnSpan='2' RowNumber='0' ColumnNumber='1' IsMasterPane='false'/><Pane Id='2' RowSpan='2' ColumnSpan='1' RowNumber='1' ColumnNumber='0' IsMasterPane='false'/><Pane Id='3' RowSpan='2' ColumnSpan='2' RowNumber='1' ColumnNumber='1' IsMasterPane='false'/></Layout>",
  }

  def index
  end

  def live
    # Defining pane grid layout.
    @pane_layout = LAYOUTS[params[:grid_size] || '1']

  end

  def playback
  end

  def error
  end

end
