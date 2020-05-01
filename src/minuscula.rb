#!/cygdrive/c/Ruby24-x64/bin/ruby
#
# @ Javier Felipe Toribio 2020-05-01
#
# Palabra en minuscula
#

require_relative "palabra"

class Minuscula < Palabra

  def initialize(palabra)

    @palabra = palabra

  end

  def estilizar(palabra)

    palabra.downcase

  end

end
