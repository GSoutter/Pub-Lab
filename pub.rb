class Pub

  attr_reader :name, :till, :drinks

  def initialize(name, till, drinks)
    @name = name
    @till = till
    @drinks = drinks
    @age_limit = 18
    @drunkeness_limit = 10
  end

  def stock_check()
    return @drinks.length
  end

  def remove_drink()
    return @drinks.pop
  end

  def till_increase(amount)
    @till += amount
  end

  def sell_drink(customer)
    drink = remove_drink()
    drink_cost = drink.price
    customer.spend_cash(drink_cost)
    till_increase(drink_cost)
  end

  def age_verify(customer)
    if customer.age >= @age_limit
      return true
    else
      return false
    end
  end

end
