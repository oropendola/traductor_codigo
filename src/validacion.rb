#!/cygdrive/c/Ruby24-x64/bin/ruby
#
# @ Javier Felipe Toribio 2020-05-06
#
# Valida argumentos del input de entrada
#

require_relative 'argumentoserroneos'

class Validacion

  def self.valida_argumentos

    lanzar_excepcion_argumentos if ARGV.length < 1

    es_ayuda = (ARGV.grep("-h") + ARGV.grep("-help")).size > 0

    lanzar_excepcion_argumentos if ARGV.length > 1 and es_ayuda

    mostrar_ayuda if es_ayuda

    comprobar_existencia_ficheros

  end

private

  def self.ayuda

     return <<-EOF

       Uso:

           #{$PROGRAM_NAME} [ -h | --help ]

           #{$PROGRAM_NAME} file1 file2 .. fileN

     EOF

  end

  def self.lanzar_excepcion_argumentos

    raise ArgumentosErroneos.new("Numero incorrecto de argumentos")

  end

  def self.lanzar_excepcion_ficheros_no_encontrados(lista)

    raise ArgumentosErroneos.new(
      "No se entraron los ficheros #{lista}"
    )

  end

  def self.mostrar_ayuda

    puts self.ayuda
    exit 0

  end

  def self.comprobar_existencia_ficheros

    encontrados = true

    faltan = []

    ARGV.each do |fichero|

      if ! File.exist?(fichero)

        faltan << fichero

        encontrados = false

      end

    end

    lanzar_excepcion_ficheros_no_encontrados(faltan) if ! encontrados

  end

end


