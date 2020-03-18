class Pub

  attr_reader :name, :till

  def initialize(name, till, drinks, foods)
    @name = name
    @till = till
    @drinks = drinks
    @age_limit = 18
    @drunkeness_limit = 10
    @foods = foods
  end

  def stock_check_total()
    total = 0
    for drink in @drinks.keys
      total += @drinks[drink]
    end
    return total
  end

  def stock_check_drink(drink)
    return @drinks[drink]
  end



  def remove_drink(drink)
    if @drinks[drink] > 0
      @drinks[drink] -=1
      return drink
    end
  end

  def till_increase(amount)
    @till += amount
  end

  def drunk_verify?(customer)
    return customer.drunkeness <= @drunkeness_limit
  end

  def customer_afford?(customer, price)
    return customer.wallet >= price
  end

  def age_verify?(customer)
    return customer.age >= @age_limit
  end

  def sell_drink(customer, drink)
    if drunk_verify?(customer) && age_verify?(customer) && customer_afford?(customer, drink.price)
      drinky = remove_drink(drink)
      drink_cost = drinky.price
      customer.spend_cash(drink_cost)
      till_increase(drink_cost)
      customer.increase_drunkeness(drink.alc_unit)
    end
  end


  def food_stock(food)
    return @foods[food]
  end

  def food_remove(food)
    @foods[food] -= 1
  end


  def sell_food(customer, food)
    return if customer.wallet <= food.price
    return if food_stock(food) < 1
    customer.spend_cash(food.price)
    till_increase(food.price)
    customer.decrease_drunkeness(food.rejuvination)
    food_remove(food)
  end

  def drink_stock_total()
    total = 0
    for drink in @drinks.keys
      sub_total = @drinks[drink]*drink.price
      total += sub_total
    end
    return total
  end






end
