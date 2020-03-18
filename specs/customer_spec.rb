require("minitest/autorun")
require('minitest/reporters')

require_relative("../customer")


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class CustomerTest < MiniTest::Test

  def setup
    @customer1 = Customer.new("Ali G", 50)
  end

  def test_get_name()
    assert_equal("Ali G", @customer1.name())
  end

  def test_wallet_amount()
    assert_equal(50, @customer1.wallet())
  end

  def test_spend_cash()
    @customer1.spend_cash(2)
    assert_equal(48, @customer1.wallet())
  end

  def test_buy_drink()
    #Given

    #When

    #Then

  end

end
