require('minitest/autorun')
require('minitest/rg')
# require_relative('../customer.rb')
require_relative('../drinks.rb')
# require_relative('../pub.rb')

class TestDrinks  < MiniTest::Test

  def setup
   @drink1 = Drink.new("whisky", 4, 30)
   @drink2 = Drink.new("porter", 3, 10)
   @drink3 = Drink.new("wine", 5, 20)
  end

  def test_drink_name
    assert_equal("porter", @drink2.name)
  end

end
