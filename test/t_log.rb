#!/cygdrive/c/Ruby24-x64/bin/ruby
#
# @ Javier Felipe Toribio 2020-04-22
#
# Test Manejador de trazas
#

require_relative "../src/log.rb"

log = Log.new("test",Log::INFO)

log.info("Mensaje informativo")

log.warn("Poca memoria")

log.error("No se pudo abrir el fichero de configuracion")

log.critico("La aplicacion se ha quedado sin memoria")

log.cerrar

log = Log.new

log.error("Disco duro al 95%")

log.cerrar


