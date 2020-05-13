#!/cygdrive/c/Ruby24-x64/bin/ruby
#
# @ Javier Felipe Toribio 2020-05-01
#
# Clase para cargar/grabar datos de un fichero
#

class Fichero

  def initialize(nombre_fichero)

    @nombre_fichero = nombre_fichero

  end

  def leer

    raise IOError, "Fichero '#{@nombre_fichero}' no encontrado" if ! File.exist? @nombre_fichero

    texto = nil

    begin

      fichero = File.open(@nombre_fichero,"r")

      texto = fichero.read

      fichero.close

    rescue StandardError

      raise IOError, "Error al cargar fichero '#{@nombre_fichero}'"

    end

    return texto

  end

  def grabar(texto)

    begin

      fichero = File.open(@nombre_fichero, "w")

      fichero.write(texto)

      fichero.close

    rescue StandardError

      raise IOError, "Error al cargar fichero '#{@nombre_fichero}'"

    end

  end

end

