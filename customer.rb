class Customer

  attr_reader(:name, :wallet, :age, :drunk_level)

  def initialize(name, wallet, age, drunk_level)
    @name = name
    @wallet = wallet
    @age = age
    @drunk_level = drunk_level
  end

  def customer_pays(drink)
    if @wallet >= drink.price
      @wallet -= drink.price
    end
    return @wallet
  end

  def can_customer_pay(drink)
    if @wallet < drink.price
      return false
    else
      return true
    end
  end

  #ask in review - is this cheating
  def buy_drink(pub, drink_name)
    drink_object = pub.is_drink_available(drink_name)
    if drink_object
      if @age >= 18
        if @drunk_level <= 100
          if can_customer_pay(drink_object) == true
            customer_pays(drink_object)
            pub.increase_takings(drink_object)
            return drink_object
          end
        end
      end
    end
    return nil
  end

  def change_drink_level(drink)
    @drunk_level += drink.alcohol_level
  end

end
