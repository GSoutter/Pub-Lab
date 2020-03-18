require("minitest/autorun")
require('minitest/reporters')

require_relative("../customer")


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class CustomerTest < MiniTest::Test

def setup
  @customer1 = Customer.new("George", 50)

  
end

end
