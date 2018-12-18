# create a Struct with :value, :next and :prev
Node = Struct.new(:value,:next,:prev)

class Lista

    include Enumerable

    attr_reader :inicio, :final

    def initialize()
      @inicio=nil
      @final=nil
    end

    def empty()
      if(@inicio == nil)
        return true
      else
        return false
      end
    end

    def insertar(value)
        if (empty)
          aux = Node.new(value,nil,nil)
          @inicio=aux
          @final=aux
          return @inicio.value
        else
          aux=Node.new(value,@final,nil)
            @final.prev = aux
            @final=aux
            return @final.value
        end
    end

    def insertar_varios(vector)
        aux = 0
        for i in vector
            insertar(i)
            aux = aux + 1
        end
        return aux
    end

    def extraer_inicio
      aux = @inicio
      @inicio = @inicio.prev

      return aux.value
    end

    def to_s
      aux = @inicio
      aux1 = "inicio -->"
      while(aux != nil)
        aux1 << aux.value.nombre + "-->"
        aux = aux.prev
      end
        aux1 << "final"
      "#{aux1}"
    end

      # Funcion sin la cual no funcionaria el Enumerable
    def each
      nodo = @inicio
      while(nodo != nil)
        yield nodo.value
        nodo = nodo.prev
      end
    end


    def clasificacion_sal()

      superior_ir=Array.new
      inferior_ir=Array.new

      while(@inicio != nil) do
        if(@inicio.value.sal >= 6)
            superior_ir << @inicio.value.sal
            extraer_inicio
        else
            inferior_ir << @inicio.value.get_sal
            extraer_inicio
        end
      end

      "Superiores a la IR #{superior_ir} | Inferiores a la IR #{inferior_ir}"

    end

    def clasificacion_masacorporal()

      bajo_peso=Array.new
      adecuado=Array.new
      sobrepeso=Array.new
      obesidad=Array.new

      while(!empty) do
        if(@inicio.value.calc_imc < 18.5)
            bajo_peso << @inicio.value.calc_imc.round(2)
            extraer_inicio
        elsif((@inicio.value.calc_imc >= 18.5) && (@inicio.value.calc_imc <= 24.9))
            adecuado << @inicio.value.calc_imc.round(2)
            extraer_inicio
        elsif((@inicio.value.calc_imc >= 25.0) && (@inicio.value.calc_imc <= 29.9))
            sobrepeso << @inicio.value.calc_imc.round(2)
            extraer_inicio
        elsif(@inicio.value.calc_imc >= 30.0)
            obesidad << @inicio.value.calc_imc.round(2)
            extraer_inicio
        end
      end

        "Bajo peso: #{bajo_peso} | Peso adecuado: #{adecuado} | Sobrepeso: #{sobrepeso} | Obeso: #{obesidad}"

    end

    def ordenamiento_for
      @aux = self.map { |x| x }

      for x in 0..@aux.length-1
        for y in 0..@aux.length-2-x
          if ( @aux[y] > @aux[y+1] )
            @aux[y], @aux[y+1] = @aux[y+1], @aux[y]
          end
        end
      end

  return @aux

    end
    def ordenamiento_each
      @aux = self.map { |x| x }
      cont=0
      @aux.each do |x|
          aux1 = x
          i = cont
          cont2=cont + 1
          @aux[cont2..@aux.length-1].each do |y|
              if aux1 > y
                  aux1 = y
                  i = cont2
              end
              cont2+=1
          end

        @aux[i] = x
        @aux[cont] = aux1
        cont+=1
        end
        @aux
    end

end

#l1 = Lista.new()
