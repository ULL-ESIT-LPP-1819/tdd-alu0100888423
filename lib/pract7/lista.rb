# create a Struct with :value, :next and :prev
Node = Struct.new(:value,:next,:prev)

class Lista
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


end

#l1 = Lista.new()
