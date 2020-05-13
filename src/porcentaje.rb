#!/cygdrive/c/Ruby24-x64/bin/ruby
#
## @ Javier Felipe Toribio 2020-05-13
#
# porcentaje
#

class Porcentaje

  def initialize

    @resultado = nil

    @recuento = {}

    @recuento.default = 0

  end

  def incluir(tipo)

    @recuento[tipo] += 1

  end

  def to_s

    return "" if @recuento.empty?

    calcular_resultado

    image = "Total palabras : #{@recuento.values.sum} "

    image += @resultado.map {|k,v| "#{k} : #{v}%"}.join(" ")

  end

private

  def calcular_resultado

    total = @recuento.values.sum

    porcentajes = @recuento.values.map do |v|

       (100.0*v/total).round(2)

    end

    @resultado = @recuento.keys.zip porcentajes

  end

end
