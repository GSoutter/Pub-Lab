require("minitest/autorun")
require('minitest/reporters')

require_relative("../food")


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class CustomerTest < MiniTest::Test

  def setup
    @food1 = Food.new("Bread", 5, 5)
  end

  def test_class
    assert_equal("Bread", @food1.name)
  end
end
