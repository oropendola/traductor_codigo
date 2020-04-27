#!/cygdrive/c/Ruby24-x64/bin/ruby -w
#
# @ Javier Felipe Toribio 2018
#
# Programa principal de la applicacion traductor
#

class ArgumentosErroneos < StandardError

  def initialize(msg)
    @msg = msg
  end

  def to_s
   "Argumentos de entrada incorrectos : #{@msg}"
  end

end

# vim: tw=79:ts=2:
