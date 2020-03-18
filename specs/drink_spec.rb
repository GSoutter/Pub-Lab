require("minitest/autorun")
require('minitest/reporters')

require_relative("../customer")
require_relative("../drink")


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class DrinkTest < MiniTest::Test

  def setup
    @drink1 = Drink.new("Babycham", 5, 2)
    @drink2 = Drink.new("Fernet-Branca", 10, 5)
    @drink3 = Drink.new("Fusilier", 2, 4)
  end

  def test_get_drink_name()
    assert_equal("Babycham", @drink1.name())
  end

  def test_drink_price()
    assert_equal(5, @drink1.price())
  end

  def test_alcohol_level_of_drink()
    assert_equal(2, @drink1.alc_unit())
  end

end
