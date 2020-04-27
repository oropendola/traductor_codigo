#!/cygdrive/c/Ruby24-x64/bin/ruby
#
# @ Javier Felipe Toribio 2020-04-27
#
#

require_relative "particion"

class SinEstilo < Particion

  def initialize(palabra)

    @estilo = "sin_estilo"
    @palabras = [palabra]

  end

  def to_s

    @palabras.first

  end

end
