class SumOfMultiples
    def initialize(*arguments)
        @array=Array.new
        for x in arguments
            @array<< x
        end
    end

    def to(number)
        total=0
        @sum=Array.new
       for i in @array
        a=0
        while i*a < number && i!=0
            if !@sum.include? a*i
                @sum << a*i
                total+=a*i
            end
            a+=1
        end 
       end
       return total
    end
end