
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
  attr_reader :cad1, :cad2, :cint1, :cint2,:peso, :talla, :nivel_actividad

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

    def peso_teorico
      peso_teorico_ideal = (@talla - 150) * 0.75 + 50
    end

    def gasto_energetico
      if(@sexo == 1)
        gasto_energetico_hom =  (10 * @peso) + (6.25 * @talla) - (5 * @edad) - 161
      else
        gasto_energetico_muj =  (10 * @peso) + (6.25 * @talla) - (5 * @edad) + 5
      end
    end

    def efecto_termogeno
      efecto_termogeno1 = gasto_energetico * 0.10
    end

    def gasto_actividad_fisica
      if(nivel_actividad == 'Reposo')
        factor_fisico = 0.0
      elsif(nivel_actividad == 'Actividad ligera')
        factor_fisico = 0.12
      elsif(nivel_actividad == 'Actividad moderada')
        factor_fisico = 0.27
      elsif(nivel_actividad == 'Actividad intensa')
        factor_fisico = 0.54
      end
      gasto_energetico * factor_fisico
    end

    def gasto_total
      gasto_energetico + efecto_termogeno + gasto_actividad_fisica
    end
end
