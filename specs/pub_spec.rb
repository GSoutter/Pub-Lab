require("minitest/autorun")
require('minitest/reporters')

require_relative("../customer")
require_relative("../drink")
require_relative("../pub")


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class PubTest < MiniTest::Test
  def setup
    @drink1 = Drink.new("Babycham", 5)
    @drink2 = Drink.new("Fernet-Branca", 10)
    @drink3 = Drink.new("Fusileir", 2)

    @drinks = [@drink1, @drink2, @drink3]

    @pub = Pub.new("The Moldy Otter", 1000, @drinks)

    @customer1 = Customer.new("Ali G", 50)
  end

  def test_get_pub_name()
    assert_equal("The Moldy Otter", @pub.name())
  end

  def test_pub_till_opening_balance()
    assert_equal(1000, @pub.till())
  end

  def test_number_of_drinks()
    assert_equal(3, @pub.stock_check())
  end

  

end
