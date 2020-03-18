class Drink

  attr_reader :name, :price, :alc_unit

  def initialize(name, price, alc_unit)
    @name = name
    @price = price
    @alc_unit = alc_unit
  end

end
