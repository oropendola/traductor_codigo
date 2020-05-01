#!/cygdrive/c/Ruby24-x64/bin/ruby
#
# @ Javier Felipe Toribio 2020-05-01
#
# Extrae el tipo de palabra
#

require_relative "minuscula"

require_relative "mayuscula"

require_relative "capital"

require_relative "sintipo"

class TipoPalabra

  def self.extraer(palabra)

    return Minuscula.new(palabra) if palabra == palabra.downcase

    return Mayuscula.new(palabra) if palabra == palabra.upcase

    return Capital.new(palabra)   if palabra == palabra.capitalize

    return SinTipo.new(palabra)

  end

end
