# Encoding: UTF-8

class ApplicationController < ActionController::Base
  protect_from_forgery
  #before_filter :check_browser, :check_for_user, :authorize

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

  private
  def import_data(model)
    begin
      importing = []
      file_name = 'public/data'
      file_data = params[:data_file]

      if yaml
        $/="\n\n"
        File.open(file_name, 'r').each do |data|
          importing += YAML::load(data)
          fail "Failed to create obj" unless importing.last.save
        end
      else
        if file_data.respond_to?(:read)
          File.open(file_name, 'wb') { |f| f.write file_data.read }
        elsif file_data.respond_to?(:path)
          File.open(file_name, 'wb') { |f| f.write File.read(file_data.path) }
        else
          fail "Bad CSV data: #{file_data.class.name}: #{file_data.inspect}"
        end

        File.open(file_name) do |f|
          f.readlines.each do |line|
            next if line.empty?
            importing << evaluate_model(model, line.split(',').chomp)
            fail "Failed to create obj" unless importing.last.save
          end
        end
      end
    ensure
      File::delete(file_name) if File::exists?(file_name)
    end
  end

  def export_data(model)
    t = File.open('', 'w') do |f|
      f.puts YAML::dump(eval("#{model.capitalize}")::all)
    end
    send_data('tmp/tmp.yaml') #, filename: "#{model}.csv", type: 'application/csv')
  end

  def evaluate_model(model, properties)
    case model
      when /warehouse/i
        Warehouse::new(label: properties[0])
      when /server/i
        Server::new(label: properties[0],
                    address: properties[1],
                    admin_port: properties[2],
                    media_port: properties[3],
                    username: properties[4],
                    password: properties[5],
                    warehouse_id: properties[6])
      when /camera/i
        Camera::new(label: properties[0],
                    camera_id: properties[1],
                    server_id: properties[2])
      else
        fail "Importing is not available for: #{model.to_s.capitalize} data type."
    end
  end

  def generate_data(model)
    # ...
  end
end
