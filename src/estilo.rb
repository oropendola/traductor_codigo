#!/cygdrive/c/Ruby24-x64/bin/ruby
#
# @ Javier Felipe Toribio 2020-04-27
#
# Detecta estilos camelcase y snakecase
#

require_relative "camelcase"
require_relative "snakecase"
require_relative "sinestilo"

class Estilo

  def self.extraer(palabra)

    if palabra.include?("_")

      return SnakeCase.new(palabra)

    elsif palabra.match(/[a-z][A-Z]/)

      return CamelCase.new(palabra)

    else

      return SinEstilo.new(palabra)

    end

  end

end
