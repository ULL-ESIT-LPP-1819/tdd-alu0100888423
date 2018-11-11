# create a Struct with :value, :next and :prev
Node = Struct.new(:value,:next,:prev)

class Lista
    attr_reader :inicio

    def initialize()
      @inicio=nil
    end

    def empty()
      if(@inicio = true)
        return true
      else
        return false
      end
    end

end
