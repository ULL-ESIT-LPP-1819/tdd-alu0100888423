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
        if(@inicio == nil)
          aux = Node.new(value,@inicio,@final)
          @inicio=aux
          @final=aux
          return @inicio.value
        elsif(@final == nil)
            aux=Node.new(value,@inicio,nil)
            @final=aux
            return @final.value
        else
          aux=Node.new(value,@final,nil)
          @final=aux
          return @final.value
        end
    end

end
