#!/cygdrive/c/Ruby24-x64/bin/ruby
#
# @ Javier Felipe Toribio 2020-04-22
#
# Manejador de trazas
#

class Log

  # Nivel del log
  CRITICO, ERROR, ALERTA, INFO = 1, 2, 3, 4

  attr_accessor :nivel

  def initialize(fichero = nil, nivel = nil)

    @nivel = nivel || INFO

    nombre_fichero = fichero || "traductor"

    nombre_fichero = "#{prefijo_tiempo_fichero}_#{nombre_fichero}.log"

    begin

       @log = open(nombre_fichero,"a+")
       @log.sync = true
       @abierto = true

    rescue StandardError => e

       puts e.message
       puts e.backtrace.inspect

    end

  end

  def cerrar

    @log.close if @abierto
    @log = nil

  end


  def info(mensaje)    trazar(INFO,    "INFO    : " << mensaje) end
  def warn(mensaje)    trazar(ALERTA,  "ALERTA  : " << mensaje) end
  def error(mensaje)   trazar(ERROR,   "ERROR   : " << mensaje) end
  def critico(mensaje) trazar(CRITICO, "CRITICO : " << mensaje) end


private

  def trazar(nivel, mensaje)

     if @log && nivel <= @nivel

        @log << prefijo_tiempo_mensaje() << " " << mensaje << "\n"

     end

  end

  def prefijo_tiempo_fichero

     formato = "%Y-%m-%d_%H_%M_%S"

     Time.now.strftime(formato)

  end

  # Fecha, hora con milisegundos

  def prefijo_tiempo_mensaje

     formato = "[%Y-%m-%d %H:%M:%S.%L]"

     Time.now.strftime(formato)

  end

end
