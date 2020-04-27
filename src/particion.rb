#!/cygdrive/c/Ruby24-x64/bin/ruby
#
# @ Javier Felipe Toribio 2020-04-27
#
# Division de una palabra en palabras
# acorde a un estilo
#
class Particion

  attr_accessor :estilo, :palabras

  def inspect

    format("Estilo: %s Palabras %s", @estilo, @palabras)

  end

end
