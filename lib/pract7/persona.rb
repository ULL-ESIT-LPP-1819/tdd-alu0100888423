
class Persona
  attr_reader :nombre, :apellido, :sexo, :edad

  def initialize(nombre, apellido, sexo, edad)
    @nombre=nombre
    @apellido=apellido
    @sexo=sexo  #1-->hombre | 0 --> mujer
    @edad = edad
  end
  def to_s
    "Me llamo #{@nombre} #{@apellido}, tengo #{@edad} años"
  end
end

class Paciente < Persona
  attr_reader :peso, :talla

  def initialize(peso, talla, nombre, apellido, sexo, edad)
    @peso=peso
    @talla=talla
    super(nombre,apellido,sexo,edad)
  end

  def calc_imc
    @peso / (@talla * @talla)
  end

  def to_s
     "Me llamo #{@nombre} #{@apellido}, tengo #{@edad} años | Datos del paciente --> #{@peso}kg, #{@talla}m"
  end

end
