#!/cygdrive/c/Ruby24-x64/bin/ruby
#
# @ Javier Felipe Toribio 2020-05-01
#
# test clase LenguajeMarcado
#


require_relative "../db/lenguajemarcado"

#    <meta charset="UTF-8"/>

meta = LenguajeMarcado.crear(
  etiqueta: "meta",
  atributo: {:llave => "charset", :valor => "UTF-8"}
)

# <title>Traduccion del castellano al ingles</title>

titulo = LenguajeMarcado.crear(
  etiqueta: "title",
  contenido: "Traduccion del castellano al ingles"
)

# anidado

head = LenguajeMarcado.crear(
  etiqueta: "head",
  contenido: meta + "\n" + titulo,
  nueva_linea: true,
)

#    <div class="trad">espanol=spanish       </div>

div1 = LenguajeMarcado.crear(
  etiqueta: "div",
  contenido: "espanol=spanish",
  atributo: {:llave => "class", :valor => "trad"}
)


div2 = LenguajeMarcado.crear(
  etiqueta: "div",
  contenido: "ingles=english",
  atributo: {:llave => "class", :valor => "trad"}
)

body = LenguajeMarcado.crear(
  etiqueta: "body",
  contenido: div1 + "\n" + div2,
  nueva_linea: true,
)

html = LenguajeMarcado.crear(
  etiqueta: "html",
  contenido: head + body,
  nueva_linea: true,
)

puts html

