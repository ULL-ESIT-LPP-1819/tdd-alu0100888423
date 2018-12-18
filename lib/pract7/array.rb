class Array
  def ordenamiento_for
    @aux = self

      for x in 0..self.length-1
        for y in 0..length-2-x
          if ( @aux[y] > @aux[y+1] )
            @aux[y], @aux[y+1] = @aux[y+1], @aux[y]
          end
        end
      end
      return @aux
  end

  def ordenamiento_each
    @aux = self
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
