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

    describe "Mostrar lista" do
      it"Método to_s?"do
        expect(@l1.to_s).to eq("inicio -->papas fritas-->pipas girasol-->ambrosia tirma-->Donut crema-->final")
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
  @paciente = Paciente.new(67,1.77,'Nombre', 'Apellido', 1, 14,0,0,0,0)
  @p2 = Paciente.new(90,1.64,'Daniel', 'Fernandez', 1, 19,0.87,0.88,0.91,0.92)
  @p3 = Paciente.new(78,1.81,'Natalia', 'Rodriguez', 0, 54,0,0,0,0)
  @p4 = Paciente.new(86,1.60,'German', 'Mendez', 1, 22,0.86,0.85,0.90,0.91)
  @p5 = Paciente.new(52,1.55,'Ana', 'Pérez', 0, 37,0,0,0,0)
  @l2 = Lista.new()
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
    it "Es una instancia de la clase?" do
        expect(@paciente.instance_of?Paciente).to eq(true)
    end
    it "No debe ser una instancia de la clase" do
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
    it "Método to_s tratamiento obesidad?" do
      expect(@p4.to_s).to eq ("Me llamo German Mendez, tengo 22 años | Datos del paciente --> 86kg, 1.6m, tiene tratamiento de obesidad -->0.94")
    end
    it"Método para calcular el imc?"do
      expect(@paciente.calc_imc.round(2)).to eq 21.39
    end
  end
  describe "Debe tener una lista creada por 5 individuos" do
    it"Meter todos los elementos en la lista?" do
      expect(@l2.insertar(@paciente)).to eq(@paciente)
      expect(@l2.insertar(@p2)).to eq(@p2)
      expect(@l2.insertar(@p3)).to eq(@p3)
      expect(@l2.insertar(@p4)).to eq(@p4)
      expect(@l2.insertar(@p5)).to eq(@p5)
    end
    it"Organizar según sus imc?"do
      expect(@l2.clasificacion_masacorporal).to eq("Bajo peso: [] | Peso adecuado: [21.39, 23.81, 21.64] | Sobrepeso: [] | Obeso: [33.46, 33.59]")
    end
  end

end



RSpec.describe Etiqueta do
    context "COMPARABLE: " do
        before :each do
          @e1 = Etiqueta.new('chocolate', 33, 20, 48, 45, 5.8, 0.003, 12, 4)
          @e2 = Etiqueta.new('chocolate', 33, 20, 48, 45, 5.8, 0.003, 12, 4)
          @e3 = Etiqueta.new('pipas girasol', 27, 18, 43, 46, 4.8, 6.2, 12, 4)
          @e4 = Etiqueta.new('ambrosia tirma', 31, 10, 57, 35, 7.2, 0.5, 12, 4)
          @e5 = Etiqueta.new('Donut crema', 36, 25, 24, 35, 3.5, 0.8, 12, 4)

        end

        it "Etiqueta3 es menor que etiqueta1" do
            expect(@e3 < @e1).to eq(true)
        end

        it "Etiqueta3 es menor o igual que etiqueta1" do
            expect(@e3 <= @e1).to eq(true)
        end

        it "Etiqueta1 es mayor que etiqueta3" do
            expect(@e1 > @e3).to eq(true)
        end

        it "Etiqueta1 es mayor o igual que etiqueta3" do
            expect(@e1 >= @e3).to eq(true)
        end

        it "etiqueta1 es igual a @etiqueta2" do
            expect(@e1 == @e2).to eq(true)
        end

        it "etiqueta1 es distinto a etiqueta3" do
            expect(@e1 != @e3).to eq(true)
        end

    end
end


RSpec.describe Etiqueta do
    context "COMPARABLE: " do
        before :each do
          @p1 = Paciente.new(67,1.77,'Nombre', 'Apellido', 1, 14,0,0,0,0)
          @p2 = Paciente.new(90,1.64,'Daniel', 'Fernandez', 1, 19,0.87,0.88,0.91,0.92)
          @p3 = Paciente.new(90,1.64,'Daniel', 'Fernandez', 1, 19,0.87,0.88,0.91,0.92)
          @p4 = Paciente.new(86,1.60,'German', 'Mendez', 1, 22,0.86,0.85,0.90,0.91)
          @p5 = Paciente.new(52,1.55,'Ana', 'Pérez', 0, 37,0,0,0,0)

        end

        it "Paciente1 es menor el imc que el del paciente2" do
            expect(@p1 < @p2).to eq(true)
        end

        it "Paciente1 es menor o igual el imc que el del paciente2" do
            expect(@p1 <= @p2).to eq(true)
        end

        it "Paciente2 es mayor el imc que el del paciente1" do
            expect(@p2 > @p1).to eq(true)
        end

        it "Paciente2 es mayor o igual el imc que el del paciente1" do
            expect(@p2 >= @p1).to eq(true)
        end

        it "Paciente2 es igual el imc que el del paciente3" do
            expect(@p2 == @p3).to eq(true)
        end

        it "Paciente1 es distinto el imc que el del paciente2" do
            expect(@p1 != @p2).to eq(true)
        end

    end
end
=begin
describe Lista do

    context "ENUMERABLE: " do
        before :each do

        @d6 = Dieta.new('DESAYUNO',15,['Leche desnatada','Cacao instantaneo','Cereales de desayuno en hojuelas','Almendras laminadas (10 unidades)'],['1 vaso',' 1 c/sopera',' 1 bol pequeño','2 c/soperas'],['200 ml','10 g','40 g','10 g'],288.0,17,21,62)
        @d7 = Dieta.new('MEDIA MAÑANA',10,['Cerezas','Galletas bifidus con sésamo'],['10-12 unidades medianas','4 unidades'],['120 g','40 g'],255.5,7,24,69)
        @d8 = Dieta.new('ALMUERZO', 30,  ['Macarrones con salsa de tomate y queso parmesano', 'Escalope de ternera', 'Ensalada básica con zanahoria rallada','Mandarina', 'Pan de trigo integral'], ['1 1/2 cucharón', '1 bistec mediano', '1 guarnición', '1 grande', '1 rodaja'], ['200 g', '100 g', '120 g', '180 g', '20 g'], 785.9, 19, 34, 47)
        @d9 = Dieta.new('MERIENDA',15,['Galletas de leche con chocolate y yogur','Flan de vainilla sin huevo'],['4 unidades','1 unidad'],['46 g','110 g'],313.6,10,30,60)
        @d10 = Dieta.new('CENA', 30, ['Crema de bubango','Tortilla campesina con espinacas','Tomate en dados con atun','Piña natural o en su jugo picada','Pan de trigo integral'],['2 cucharones', '1 cuña grande','5 a 6 c/soperas','5 c/soperas','1 rodaja'],["200 g","150 g"," 150 g","120 g"], 561.6,19,40,41)

        @l6 = Lista.new()
        @v6 = [@d7,@d8,@d9,@d10]

        end


        describe "ALL?" do
            it "Insertando un elemento Dieta :" do
                @l6.insertar_uno_inicio(@d6)
                expect(@l6.all?).to eq(true)
            end

            it "Insertando varios elementos :" do
              @l6.insertar_varios(@v6)
              expect(@l6.all?).to eq(true)
            end

            it "Metodo all? con lista vacia :" do
                expect(@l6.all?).to eq(true)
            end
        end

        describe "ANY?" do
            it "Insertando un elemento Dietas :" do
                @l6.insertar_uno_inicio(@d6)
                expect(@l6.any?).to eq(true)
            end

            it "Insertando varios elementos :" do
              @l6.insertar_varios(@v6)
              expect(@l6.any?).to eq(true)
            end
        end

        describe "COLLECT" do
            it "Metodo collect :" do
                @l6.insertar_uno_inicio(@d6)
                 expect(@l6.map{|i| i.vct*i.vct}).to eq([82944.0])
                 expect(@l6.collect{|i| i.vct*i.vct}).to eq([82944.0])
            end
        end

        describe "COUNT" do
            it "Metodo count :" do
                @l6.insertar_varios(@v6)
                expect(@l6.count).to eq(4)
            end
        end

        describe "DETECT Y FIND" do
            it "Metodo detect y find :" do
                @l6.insertar_varios(@v6)
                expect(@l6.detect {|i| i.vct == 255.5}).to eq(@d7)
                expect(@l6.find {|i| i.vct == 313.6}).to eq(@d9)
            end
        end

        describe "DROP" do
            it "Metodo drop :" do
                @l6.insertar_varios(@v6)
                expect(@l6.drop(3)).to eq([@d7])
            end
        end

        describe "MAX" do
            it "Metodo max :" do
                @l6.insertar_uno_inicio(@d6)
                @l6.insertar_uno_inicio(@d7)
                expect(@l6.max).to eq(@d6)
            end
        end

        describe "MIN" do
            it "Metodo min :" do
                @l6.insertar_uno_inicio(@d6)
                @l6.insertar_uno_inicio(@d7)
                expect(@l6.min).to eq(@d7)
            end
        end

        describe "SORT" do
            it "Metodo sort :" do
                @l6.insertar_varios(@v6)
                expect(@l6.sort).to eq([@d7,@d9,@d10,@d8])
            end
        end
    end
=end
