
class Persona

  include Comparable

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
  attr_reader :cad1, :cad2, :cint1, :cint2,:peso, :talla

  def initialize(peso, talla, nombre, apellido, sexo, edad,cint1, cint2, cad1, cad2, nivel_actividad)
    @cad1 = cad1
    @cad2 = cad2
    @cint1 = cint1
    @cint2 = cint2
    @peso=peso
    @talla=talla
    @nivel_actividad=nivel_actividad
    super(nombre,apellido,sexo,edad)
  end

    def calc_imc
      @peso / (@talla * @talla)
    end

  # Funcion para el comparable
    def <=> other
        calc_imc <=> other.calc_imc
    end

  def trata_obesidad
    if(calc_imc >= 30.0)
      return true
    else
      return false
    end
  end

  def to_s
    if(trata_obesidad)
     "Me llamo #{@nombre} #{@apellido}, tengo #{@edad} años | Datos del paciente --> #{@peso}kg, #{@talla}m, tiene tratamiento de obesidad -->#{calc_rel.round(2)}"
   else
     "Me llamo #{@nombre} #{@apellido}, tengo #{@edad} años | Datos del paciente --> #{@peso}kg, #{@talla}m"
   end
  end

  def calc_rel
    if(trata_obesidad)
    mediacad= (@cad1+@cad2)/2
    mediacint= (@cint1+@cint2)/2
    mediacint / mediacad
    end
  end

end
