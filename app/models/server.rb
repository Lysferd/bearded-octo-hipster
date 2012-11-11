class Server < ActiveRecord::Base

  has_secure_password
  attr_accessible :address, :label, :username, :password, :password_confirmation

  # -=-=-=-=-
  # * Pane Layout Generator
  # Generates a XML Schema for a certain size of panel grid.
  # @param [String] grid_layout Grid size, based on LAYOUTS constant.
  # @return [String] Panel/Grid style in XML.
  def generate_layout( grid_layout = LAYOUTS[0] )
    grid_layout[/(?<rows>\d)x(?<columns>\d)/i]
    layout = "<?xml version='1.0' encoding='utf-8' ?>
              <Layout xmlns='urn:VideoLayoutSchema'
                      Name='#{rows}x#{columns}'
                      Rows='#{rows}'
                      Columns='#{columns}'
                      AspectRatio='4:3'>"
    rows.times do |r|
      columns.times do |c|
        i ||= 0
        i += 1
        #fixme: what's a master pane?
        layout << "<Pane Id='#{i}'
                         RowSpan='#{r+2}'
                         ColumnSpan='#{c+2}'
                         RowNumber='#{r+1}'
                         ColumnNumber='#{c+1}'
                         IsMasterPane='true'/>"
        #"<Pane Id='1' RowSpan='1' ColumnSpan='2' RowNumber='0' ColumnNumber='1' IsMaterPane='false' />"
      end
    end
    layout << "</Layout>"
  end

  # @param [Integer] camera_index
  # @return [String]
  def generate_uri( camera_index = 0 )
    "nvr://#@username:#@password@#@address/media/#{camera_index}/video/0/"
  end

end
