#!/cygdrive/c/Ruby24-x64/bin/ruby
#
# @ Javier Felipe Toribio 2020-05-01
#
# Lenguaje de marcado
#

class LenguajeMarcado

  TABULADOR = "  "

  def self.crear(
    etiqueta: nil,
    contenido: nil,
    atributo: nil,
    nueva_linea: false,
    numero_indentacion: 0
  )

    indentacion = TABULADOR * numero_indentacion

    elemento_atributo = crea_atributo(atributo)

    return indentacion +
      "<" + etiqueta + elemento_atributo + "/>" if contenido.nil?

    apertura = "<" + etiqueta + elemento_atributo + ">"

    cierre   = "</" + etiqueta + ">"

    return indentacion + 
      apertura + contenido + cierre if ! nueva_linea

    return con_nueva_linea(indentacion, apertura, cierre, contenido)

  end

private

  def self.con_nueva_linea(indentacion, apertura, cierre, contenido)

    blancos = TABULADOR + indentacion

    if contenido.include?("\n")

      tabulado = contenido.split("\n").
        map {|linea| blancos + linea }.join("\n")

    else

      tabulado = blancos + contenido

    end

    indentacion + apertura + "\n" + tabulado + "\n" + indentacion + cierre + "\n"

  end


  def self.crea_atributo(atributo)

    return "" if atributo.nil?

    elemento = " " + atributo[:llave] + "=" + "\"#{atributo[:valor]}\""

    return elemento

  end

end
