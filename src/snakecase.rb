#!/cygdrive/c/Ruby24-x64/bin/ruby
#
# @ Javier Felipe Toribio 2020-04-27
#
#

require_relative "particion"

class SnakeCase < Particion

  def initialize(palabra)

    @estilo = "snake_case"
    @palabras = palabra.split("_")

  end

  def to_s

    @palabras.join("_")

  end

end
