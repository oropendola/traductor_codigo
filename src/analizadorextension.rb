#!/cygdrive/c/Ruby24-x64/bin/ruby
#
# @ Javier Felipe Toribio 2020-04-21
#
# Reconoce lenguaje de un fichero de codigo fuente
# examinando su extension
#

require_relative 'ruby'

class AnalizadorExtension

   def self.lenguaje(nombre_fichero)

      nombre, extension = nombre_fichero.split(".")

      begin

        PATRONES[extension]

      rescue

         abort("Extension '#{extension}' no encontrada")

      end

   end

   private

     PATRONES = { 'rb' => Ruby.new }

end
