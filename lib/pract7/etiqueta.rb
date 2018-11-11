#!/usr/bin/ruby

class Etiqueta
  attr_reader :nombre, :cantidad_grasa, :grasa_saturada, :hidratos, :azucares, :proteinas, :sal, :porcion, :nporciones

  def initialize(nombre, cantidad_grasa, grasa_saturada, hidratos, azucares, proteinas, sal, porcion, nporciones)
    @nombre = nombre
    @cantidad_grasa = cantidad_grasa
    @grasa_saturada = grasa_saturada
    @hidratos = hidratos
    @azucares = azucares
    @proteinas = proteinas
    @sal = sal
    @porcion = porcion
    @nporciones = nporciones
  end

  def get_nombre
    @nombre
  end

  def get_valor_energetico
    valor_energeticoKJ = @cantidad_grasa * 37 + @hidratos * 17 + @proteinas * 17
    valor_energeticoKcal = @cantidad_grasa * 9 + @hidratos * 4 + @proteinas * 4
    "#{valor_energeticoKJ} KJ (#{valor_energeticoKcal} Kcal)"
  end

  def get_cantidad_grasas
    @cantidad_grasa
  end

  def get_grasas_saturadas
    @grasa_saturada
  end

  def get_hidratos
    @hidratos
  end

  def get_azucares
    @azucares
  end

  def get_proteinas
    @proteinas
  end

  def get_sal
    @sal
  end

  def get_porciones
    if(@nporciones > 0)
    "#{@nporciones} porciones de #{@porcion}g"
    else
      "No se divide en porciones."
    end
  end

  def porcentaje_valor_energetico
    valor_energeticoKJ = @cantidad_grasa * 37 + @hidratos * 17 + @proteinas * 17
    (valor_energeticoKJ*100) / 8400

  end
  def porcentaje_grasas
      (@cantidad_grasa*100) / 70
  end
  def porcentaje_grasas_saturadas
      (@grasa_saturada*100) / 20
  end
  def porcentaje_hidratos
      (@hidratos*100) / 260
  end
  def porcentaje_azucares
      (@azucares*100) / 90
  end
  def porcentaje_proteinas
      (@proteinas*100) / 50
  end
  def porcentaje_sal
      (@sal*100) / 6
  end

  def etiqueta_formateada
    "#{nombre} -->\t \t Por 100g de producto \n\t Valor energético: #{get_valor_energetico} \t #{porcentaje_valor_energetico.round(2)}% \n\t Cantidad de grasas: #{@cantidad_grasa} gramos \t #{porcentaje_grasas.round(2)}% \n\t Cantidad de grasas saturadas: #{@grasa_saturada} gramos  \t #{porcentaje_grasas_saturadas.round(2)}% \n\t Cantidad de hidratos de carbono: #{@hidratos} gramos \t #{porcentaje_hidratos.round(2)}% \n\t Cantidad de azúcares: #{@azucares} gramos \t #{porcentaje_azucares.round(2)}% \n\t Cantidad de proteínas: #{@proteinas} gramos \t #{porcentaje_proteinas.round(2)}% \n\t Cantidad de sal: #{@sal} gramos \t #{porcentaje_sal.round(2)}% \n#{get_porciones}"
  end
end
