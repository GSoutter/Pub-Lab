require("minitest/autorun")
require('minitest/reporters')

require_relative("../customer")
require_relative("../drink")


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class DrinkTest < MiniTest::Test

  def setup
    @drink1 = Drink.new("Babycham", 5)
    @drink2 = Drink.new("Fernet-Branca", 10)
    @drink3 = Drink.new("Fusileir", 2)

    @customer1 = Customer.new("Ali G", 50)
  end

  def test_get_drink_name()
    assert_equal("Babycham", @drink1.name())
  end

  def test_drink_price()
    assert_equal(5, @drink1.price())
  end

end
