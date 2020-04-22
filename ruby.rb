#!/cygdrive/c/Ruby24-x64/bin/ruby
#
# @ Javier Felipe Toribio 2020-04-21
#
# Clase representando el lenguaje ruby
#

require_relative 'lenguaje'

class Ruby < Lenguaje

  def initialize
     @tipo   = :ruby
     @nombre = "ruby"
  end

end

