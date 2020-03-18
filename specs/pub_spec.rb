require("minitest/autorun")
require('minitest/reporters')

require_relative("../customer")
require_relative("../drink")
require_relative("../pub")


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class PubTest < MiniTest::Test
  def setup
    @drink1 = Drink.new("Babycham", 5, 2)
    @drink2 = Drink.new("Fernet-Branca", 10, 5)
    @drink3 = Drink.new("Fusilier", 2, 4)

    @drinks = [@drink1, @drink2, @drink3]

    @pub = Pub.new("The Moldy Otter", 1000, @drinks)

    @customer1 = Customer.new("Ali G", 50, 32, 0)
    @customer2 = Customer.new("Tyler", 10, 16, 20)
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

  def test_drink_is_served()
    assert_equal(@drink3, @pub.remove_drink())
  end

  def test_receive_money()
    @pub.till_increase(2)
    assert_equal(1002, @pub.till())
  end

  def test_sell_drink()
    @pub.sell_drink(@customer1)
    assert_equal(1002, @pub.till())
    assert_equal(2, @pub.stock_check())
    assert_equal(48, @customer1.wallet())
  end

  def test_pub_age_limit()
    assert(@pub.age_verify(@customer1))
  end

end
