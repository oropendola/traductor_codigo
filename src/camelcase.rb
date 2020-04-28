#!/cygdrive/c/Ruby24-x64/bin/ruby
#
# @ Javier Felipe Toribio 2020-04-27
#
#

require_relative "particion"
require_relative "snakecase"

class CamelCase < Particion

  def initialize(palabra)

    @estilo = "camel_case"

    to = palabra.index(/[A-Z]/)

    @palabras = [palabra[0...to]]

    loop do

      from = to

      to = palabra.index(/[A-Z]/,to + 1)

      if to.nil?

        @palabras << palabra[from..]

        return palabras

      end

      @palabras << palabra[from..to - 1]

    end

  end

  def to_s

    @palabras.join("")

  end

  def to_snake_case

    nuevo = @palabras.map {|str| str.downcase }.join("_")

    return SnakeCase.new(nuevo)

  end


end
