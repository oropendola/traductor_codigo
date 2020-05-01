#!/cygdrive/c/Ruby24-x64/bin/ruby
#
# @ Javier Felipe Toribio 2020-05-01
#
# Manejo de ficheros xml
#

require_relative "lenguajemarcado"

require_relative "../lib/fichero"

class XMLFichero < LenguajeMarcado

  RUTA_DATABASE = "../db/"

  EXTENSION = ".html"

  INDEFINIDO = "@NOT_DEFINED@"

  def initialize(nombre_fichero)

    @nombre_fichero = nombre_fichero

  end

  def grabar(palabras)

    pagina = construir(palabras)


    fichero = Fichero.new(@nombre_fichero)

    fichero.grabar(pagina)

  end

  def self.ruta

    RUTA_DATABASE

  end

  def self.extension

    EXTENSION

  end

  def self.undefined

    INDEFINIDO

  end

private

  def construir(palabras)

    meta = LenguajeMarcado.crear(
      etiqueta: "meta",
      atributo: {:llave => "charset", :valor => "UTF-8"}
    )

    titulo = LenguajeMarcado.crear(
      etiqueta: "title",
      contenido: "Traduccion del castellano al ingles"
    )

    head = LenguajeMarcado.crear(
      etiqueta: "head",
      contenido: meta + "\n" + titulo,
      nueva_linea: true,
    )

    divs = []

    palabras.each do |palabra|

      divs << LenguajeMarcado.crear(
        etiqueta: "div",
        contenido: palabra + "=" + INDEFINIDO,
        atributo: {:llave => "class", :valor => "trad"}
      )

    end

    body = LenguajeMarcado.crear(
      etiqueta: "body",
      contenido: divs.join("\n"),
      nueva_linea: true,
    )

    html = LenguajeMarcado.crear(
      etiqueta: "html",
      contenido: head + body,
      nueva_linea: true,
    )

    html

  end

end
