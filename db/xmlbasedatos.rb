#!/cygdrive/c/Ruby24-x64/bin/ruby
#
# @ Javier Felipe Toribio 2020-04-24
#
# Acceso y consultar a la base de datos XML
#
#

require 'rexml/document'

require_relative 'basedatos'

class XMLBaseDatos < BaseDatos

   def initialize(fichero)

      @fichero = fichero
      @datos = {}

      cargar

   end

   def buscar(palabra)
     raise StandardError.new("Database no cargada") if @datos.nil?

     return "No se ha encontrado traduccion para '#{palabra}'" if ! @datos.include? palabra

     @datos[palabra]

   end

   # TODO
   def insertar(palabra,traduccion)
   end

private

  def cargar

    begin

      acceso = File.new (@fichero)

      @doc = REXML::Document.new acceso

      @doc.elements.each("//div[@class='trad']") do |elemento|

         primero, segundo = elemento.to_s.
            gsub(/<[^<>]*>/,"").strip.split("=")

         @datos[primero]=segundo

      end

    rescue StandardError => e

       puts "Error al intentar cargar datos de #{@fichero}"
       puts e.message
       puts e.backtrace.inspect

    end
  end

end
