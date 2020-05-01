#!/cygdrive/c/Ruby24-x64/bin/ruby
#
# @ Javier Felipe Toribio 2020-04-29
#
# Traduccion de un fichero de un idioma a otro
#

require_relative "../db/xmlbasedatos"

require_relative "analizadorextension"

require_relative "fichero"

require_relative "tipopalabra"

require_relative "estilo"

class Traduccion

  attr_reader :resultado

  def initialize(origen,destino,nombre_fichero)

    @nombre_fichero = nombre_fichero

    @base_datos = nil

    @texto = nil

    @resultado = nil

    leer_base_datos(origen, destino)

    leer_fichero

  end

  def convertir

    @resultado = { :texto => @texto, :sin_traducir => [] }

    palabras = extraer_palabras

    palabras.each do |palabra|

      traducir(palabra)

    end

  end

  def grabar

    nuevo_fichero = Fichero.new("new_" + @nombre_fichero)

    nuevo_fichero.grabar(@resultado[:texto])

  end

private

  RUTA_DATABASE = "../db/"

  def leer_base_datos(origen, destino)

    nombre_base_datos = RUTA_DATABASE + origen + "_" + destino + ".html"
    @base_datos = XMLBaseDatos.new(nombre_base_datos)

  end

  def leer_fichero

    fichero = Fichero.new(@nombre_fichero)

    @texto = fichero.leer

  end

  def extraer_palabras

    lenguaje = AnalizadorExtension.lenguaje(@nombre_fichero)

    filtrado = @texto.gsub(/[^a-zA-Z_]/," ").strip.split

    palabras_fichero = Set.new(filtrado)

    reservadas = Set.new(lenguaje.palabras_reservadas)

    palabras = palabras_fichero - reservadas

    extraidas = []

    palabras.each do |palabra|

      extraidas += Estilo.extraer(palabra).palabras

    end

    extraidas

  end

  def traducir(palabra)

    tipo_palabra = TipoPalabra.extraer(palabra)

    traduccion = @base_datos.buscar(palabra.downcase)

    if traduccion

      nueva_palabra = tipo_palabra.estilizar(traduccion)

      @resultado[:texto].gsub!(palabra, nueva_palabra)

    else

      @resultado[:sin_traducir] << palabra

    end

  end

end
