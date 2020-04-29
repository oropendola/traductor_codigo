#!/cygdrive/c/Ruby24-x64/bin/ruby
#
# @ Javier Felipe Toribio 2020-04-29
#
# Traduccion de un fichero de un idioma a otro
#

require_relative "../db/xmlbasedatos"

require_relative "analizadorextension"

class Traduccion

  RUTA_DATABASE = "../db/"

  def initialize(origen,destino,nombre_fichero)

    @nombre_base_datos = RUTA_DATABASE + origen + "_" + destino + ".html"
    @nombre_fichero = nombre_fichero

    @base_datos = nil

    @texto = nil

    @nuevo_texto = nil

    @no_encontradas = []

    @lenguaje = AnalizadorExtension.lenguaje(nombre_fichero)

    raise LoadError, "Fichero de base de datos '#{@nombre_base_datos}' no encontrado" if ! File.exist? @nombre_base_datos

    raise LoadError, "Fichero para traducir '#{nombre_fichero}' no encontrado" if ! File.exist? nombre_fichero

    leer_base_datos

    leer_fichero

  end

  def convertir

    @nuevo_texto = @texto

    palabras_fichero = Set.new(@texto.strip.gsub(/\s+["'.=]/," ").split)

    reservadas = Set.new(@lenguaje.palabras_reservadas)

    palabras = palabras_fichero - reservadas

    palabras.each do |palabra|

      traduccion = @base_datos.buscar(palabra)

      if traduccion

        @nuevo_texto.gsub!(palabra,traduccion)

      else

        @no_encontradas << palabra

      end

    end

  end

  def resultado

    { :nuevo_texto => @nuevo_texto, :no_encontradas => @no_encontradas }

  end

  def grabar

    nuevo_nombre_fichero = "new_" + @nombre_fichero

    fichero = File.open(nuevo_nombre_fichero, "w")

    fichero.write(@nuevo_texto)

    fichero.close

  end

private

  def leer_base_datos

    begin

      @base_datos = XMLBaseDatos.new(@nombre_base_datos)

    rescue Exception => e

      raise LoadError, "Error al cargar fichero de base de datos '#{@nombre_base_datos}'"

    end

  end

  def leer_fichero

    begin

      fichero = File.open(@nombre_fichero,"r")

      @texto = fichero.read

      fichero.close

    rescue Exception => e

      raise LoadError, "Error al cargar fichero '#{@nombre_fichero}'"

    end

  end

end
