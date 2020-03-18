require("minitest/autorun")
require('minitest/reporters')

require_relative("../customer")
require_relative("../drink")
require_relative("../pub")
require_relative("../food")


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class PubTest < MiniTest::Test
  def setup
    @drink1 = Drink.new("Babycham", 5, 2)
    @drink2 = Drink.new("Fernet-Branca", 10, 5)
    @drink3 = Drink.new("Fusilier", 2, 4)

    @drinks = Hash.new(0)
    @drinks[@drink1] = 3
    @drinks[@drink2] = 3
    @drinks[@drink3] = 3

    @food1 = Food.new("Bread", 5, 5)
    @foods = Hash.new(0)
    @foods[@food1] = 3


    @pub = Pub.new("The Moldy Otter", 1000, @drinks, @foods)

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
    assert_equal(9, @pub.stock_check_total())
  end

  def test_drink_is_served()
    drink = @pub.remove_drink(@drink3)
    assert_equal(@drink3, drink)
    assert_equal(2, @pub.stock_check_drink(@drink3))
  end

  def test_receive_money()
    @pub.till_increase(2)
    assert_equal(1002, @pub.till())
  end

  def test_sell_drink()
    @pub.sell_drink(@customer1, @drink1)
    assert_equal(1005, @pub.till())
    assert_equal(2, @pub.stock_check_drink(@drink1))
    assert_equal(45, @customer1.wallet())
    assert_equal(2, @customer1.drunkeness)
  end

  def test_pub_age_limit__true()
    assert(@pub.age_verify?(@customer1))
  end

  def test_pub_age_limit__false()
    assert_equal(false, @pub.age_verify?(@customer2))
  end

  def test_pub_drunk_limit__true()
    assert_equal(true, @pub.drunk_verify?(@customer1))
  end

  def test_pub_drunk_limit__true()
    assert_equal(false, @pub.drunk_verify?(@customer2))
  end

  def test_customer_can_afford()
    assert(@pub.customer_afford?(@customer1, 1))
  end


  def test_customer_sell_food()
    @pub.sell_food(@customer2, @food1)
    assert_equal(1005, @pub.till())
    assert_equal(2, @pub.food_stock(@food1))
    assert_equal(5, @customer2.wallet())
    assert_equal(15, @customer2.drunkeness)
  end

  def test_drink_stock_total
    assert_equal(51, @pub.drink_stock_total)
  end

end
