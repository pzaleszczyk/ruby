class BookStore
    @@book_price = 8.00
    
    def self.calculate_price(cart)
      total = 0.00
      return total if cart.empty?
      @totals = []
      hash = Hash.new(0)
      cart.each{ |book| hash[book] += 1 }
      evaluate(hash.values, total)
      @totals.min
    end
  
    def self.evaluate(books, total)
      new_cart = books.sort.reverse
      count = books.count{ |amount| amount > 0 }
      if count == 0
        @totals << total
      else
        for number in 1..count
          new_cart[number-1] -= 1
          evaluate(new_cart, total + discounted_price(number))
        end
      end
    end
  
    def self.discounted_price(amount)
      total = @@book_price * amount
      if amount == 5
        total *= 0.75
      elsif amount == 4
        total *= 0.80
      elsif amount == 3
        total *= 0.90
      elsif amount == 2
        total *= 0.95
      elsif amount == 1
        total
      end
    end
  end