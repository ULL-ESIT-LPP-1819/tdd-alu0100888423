
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
