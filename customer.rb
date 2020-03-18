class Customer

  attr_reader :name, :wallet, :age, :drunkeness
  attr_writer :wallet

  def initialize(name, wallet, age, drunkeness)
    @name = name
    @wallet = wallet
    @age = age
    @drunkeness = drunkeness
  end

  def spend_cash(amount)
    @wallet -= amount
  end

end
