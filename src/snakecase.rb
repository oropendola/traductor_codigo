#!/cygdrive/c/Ruby24-x64/bin/ruby
#
# @ Javier Felipe Toribio 2020-04-27
#
#

require_relative "particion"
require_relative "camelcase"

class SnakeCase < Particion

  def initialize(palabra)

    @estilo = "snake_case"
    @palabras = palabra.split("_")

  end

  def to_s

    @palabras.join("_")

  end

  def to_camel_case

    nuevo = @palabras.map { |str| str.capitalize }.join("")

    return CamelCase.new(nuevo)

  end

end
