# Encoding: UTF-8

module AdminHelper

  def translate(word)
    case word
      when /warehouse/i
        'armazém'
      when /server/i
        'servidor'
      when /camera/i
        'câmera'
    end
  end

end
