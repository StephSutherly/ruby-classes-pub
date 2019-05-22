class Pub

  attr_reader(:name, :till, :drinks)

  def initialize(name, till, drinks)
    @name = name
    @till = till
    @drinks = drinks
  end

  def increase_takings(drink)
    @till += drink.price
    return @till
  end

  def is_drink_available(drink_name)
    for drink_object in @drinks
      if drink_object.name == drink_name
        return drink_object
      end
    end
    return false
  end

  def check_age(customer)
    if customer.age >= 18
      return true
    else
      return false
    end
  end

end
