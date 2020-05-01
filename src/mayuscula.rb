#!/cygdrive/c/Ruby24-x64/bin/ruby
#
# @ Javier Felipe Toribio 2020-05-01
#
# Palabra en mayuscula
#

require_relative "palabra"

class Mayuscula < Palabra

  def initialize(palabra)

    @palabra = palabra

  end

  def estilizar(palabra)

    palabra.upcase

  end

end
