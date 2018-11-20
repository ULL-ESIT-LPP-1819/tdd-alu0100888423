require "spec_helper"
=begin
RSpec.describe Etiqueta do
  it "has a version number" do
    expect(Pract7::VERSION).not_to be nil
  end
  before :each do
    @e1 = Etiqueta.new('chocolate', 33, 20, 48, 45, 5.8, 0.003, 12, 4)
  end

describe "#Debe existir para la etiqueta" do
    it "Existe el nombre. " do
        expect(@e1.nombre).not_to be_empty
    end
    it "Existe la cantidad de grasas. " do
        expect(@e1.cantidad_grasa).to eq(33)
    end

    it "Existe la cantidad de grasas saturadas. " do
        expect(@e1.grasa_saturada).to eq(20)
    end

    it "Existe la cantidad de hidratos de carbono. " do
        expect(@e1.hidratos).to eq(48)
    end

    it "Existe la cantidad de azúcares. " do
        expect(@e1.azucares).to eq(45)
    end

    it "Existe la cantidad de proteínas. " do
        expect(@e1.proteinas).to eq(5.8)
    end

    it "Existe la cantidad de sal. " do
        expect(@e1.sal).to eq(0.003)
    end
end

describe "#Debe existir un método " do
    it "Existe el método para obtener el nombre. " do
        expect(@e1.get_nombre).to eq('chocolate')
    end

    it "Existe el método para obtener el valor energético. " do
        expect(@e1.get_valor_energetico).to eq('2135.6 KJ (512.2 Kcal)')
    end

    it "Existe el método para obtener la cantidad de grasas. " do
        expect(@e1.get_cantidad_grasas).to eq(33)
    end

    it "Existe el método para obtener la cantidad de grasas saturadas. " do
        expect(@e1.get_grasas_saturadas).to eq(20)
    end

    it "Existe el método para obtener la cantidad de hidratos de carbono. " do
        expect(@e1.get_hidratos).to eq(48)
    end

    it "Existe el método para obtener la cantidad de azúcares. " do
        expect(@e1.get_azucares).to eq(45)
    end

    it "Existe el método para obtener la cantidad de proteínas. " do
        expect(@e1.get_proteinas).to eq(5.8)
    end

    it "Existe el método para obtener la cantidad de sal. " do
        expect(@e1.get_sal).to eq(0.003)
    end

    it "Existe un método para obtener la etiqueta formateada." do
        expect(@e1.etiqueta_formateada).to eq("chocolate -->\t \t Por 100g de producto \n\t Valor energético: 2135.6 KJ (512.2 Kcal) \t 25.42% \n\t Cantidad de grasas: 33 gramos \t 47.0% \n\t Cantidad de grasas saturadas: 20 gramos  \t 100.0% \n\t Cantidad de hidratos de carbono: 48 gramos \t 18.0% \n\t Cantidad de azúcares: 45 gramos \t 50.0% \n\t Cantidad de proteínas: 5.8 gramos \t 11.6% \n\t Cantidad de sal: 0.003 gramos \t 0.05% \n4 porciones de 12g")
    end
  end
end

=end
RSpec.describe Lista do
  before :all do
    @e1 = Etiqueta.new('chocolate', 33, 20, 48, 45, 5.8, 0.003, 12, 4)
    @e2 = Etiqueta.new('papas fritas', 33, 20, 48, 45, 5.8, 7.5, 12, 4)
    @e3 = Etiqueta.new('pipas girasol', 33, 20, 48, 45, 5.8, 6.2, 12, 4)
    @e4 = Etiqueta.new('ambrosia tirma', 33, 20, 48, 45, 5.8, 0.5, 12, 4)
    @e5 = Etiqueta.new('Donut crema', 33, 20, 48, 45, 5.8, 0.8, 12, 4)

    @l1 = Lista.new()
    @v1 = [@e2, @e3, @e4, @e5]

  end

  describe "Lista:" do
      it "nodo1 igual a null?" do
          expect(@l1.inicio).to be_nil
      end
      it "lista vacía" do
        expect(@l1.empty).to be true
      end
  end
  describe "Insertando elementos:" do
    it "Insertar un elemento a la lista:" do
      expect(@l1.insertar(@e1)).to eq(@e1)
      expect(@l1.insertar(@e2)).to eq(@e2)
      expect(@l1.insertar(@e3)).to eq(@e3)
      expect(@l1.insertar(@e4)).to eq(@e4)
      expect(@l1.insertar(@e5)).to eq(@e5)
    end
  #  it"Insertar varios elementos a la lista:" do
  #    expect(@l1.insertar_varios(@v1)).to eq(4)
  #  end

    it"Extraer por el inicio" do
      expect(@l1.extraer_inicio).to eq(@e1)
      #expect(@l1.inicio).not_to be nil
    end
  end

    describe "Clasificando según los gramos de sal." do
      it"Clasificando por gramos de sal."do
        expect(@l1.clasificacion_sal).to eq("Superiores a la IR [7.5, 6.2] | Inferiores a la IR [0.5, 0.8]")
      end
    end

end

RSpec.describe Persona do
    before :all do
      @persona= Persona.new('Nombre', 'Apellido', 1, 14)
    end
    describe "La persona tiene " do
      it "Tiene un nombre" do
        expect(@persona.nombre).to eq 'Nombre'
      end
      it "Tiene un apellido" do
        expect(@persona.apellido).to eq 'Apellido'
      end
      it "Tiene un sexo" do
        expect(@persona.sexo).to eq 1
      end
      it "Tiene una edad" do
        expect(@persona.edad).to eq 14
      end
      it "Tiene un método to_s" do
        expect(@persona.to_s).to eq 'Me llamo Nombre Apellido, tengo 14 años'
      end
    end

    describe "Jerarquia de la clase Persona" do
        it "Pertenece a la Clase Object?" do
           expect(@persona.is_a?Object).to eq(true)
        end
        it "Pertenece a la Clase BasicObject?" do
           expect(@persona.is_a?BasicObject).to eq(true)
        end
    end
end

RSpec.describe Paciente do
  before :all do
  @paciente = Paciente.new(67,1.77,'Nombre', 'Apellido', 1, 14)
  end
  describe "Es un método: " do
    it"Talla es un método de la propia clase?" do
      expect(@paciente.respond_to?:talla).to eq true
    end
  end
  describe "Metodo Heredado" do
      it "Es un metodo heredado de la superclase?" do
          expect(@paciente.respond_to?:nombre).to eq(true)
      end
  end
  describe "Instancia" do
    it "El metodo es una instancia de la clase?" do
        expect(@paciente.instance_of?Paciente).to eq(true)
    end
    it "El metodo no debe ser una instancia de la clase" do
        expect(@paciente.instance_of?Persona).to eq(false)
    end
  end

  describe "Jerarquía " do
    it "Pertenece a la Clase Persona?" do
      expect(@paciente.is_a?Persona).to eq(true)
    end
    it "Pertenece a la Clase Object?" do
      expect(@paciente.is_a?Object).to eq(true)
    end
    it "Pertenece a la Clase BasicObject?" do
      expect(@paciente.is_a?BasicObject).to eq(true)
    end
  end
  describe "Debe tener método:" do
    it "Método to_s?" do
      expect(@paciente.to_s).to eq ("Me llamo Nombre Apellido, tengo 14 años | Datos del paciente --> 67kg, 1.77m")
    end
    it"Método para calcular el imc?"do
      expect(@paciente.calc_imc.round(2)).to eq 21.39
    end
  end
end
