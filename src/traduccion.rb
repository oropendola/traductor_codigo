#!/cygdrive/c/Ruby24-x64/bin/ruby
#
# @ Javier Felipe Toribio 2020-04-29
#
# Traduccion de un fichero de un idioma a otro
#


require_relative "analizadorextension"

require_relative "tipopalabra"

require_relative "estilo"

require_relative "../lib/fichero"

require_relative "../db/xmlfichero"

require_relative "../db/xmlbasedatos"

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

    nombre_fichero_indefinidas = nombre_fichero_database("indefinidas")

    fichero_indefinidas = XMLFichero.new(nombre_fichero_indefinidas)

    fichero_indefinidas.grabar(@resultado[:sin_traducir])

  end

private

  def nombre_fichero_database(nombre)

    XMLFichero.ruta + nombre + XMLFichero.extension

  end

  def leer_base_datos(origen, destino)

    nombre_base_datos = nombre_fichero_database(origen + "_" + destino)

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

    elsif ! palabra.empty?

      @resultado[:sin_traducir] << palabra

    end

  end

end
