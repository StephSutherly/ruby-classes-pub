require('minitest/autorun')
require('minitest/rg')
require_relative('../customer.rb')
require_relative('../drinks.rb')
require_relative('../pub.rb')

class TestPub  < MiniTest::Test

  def setup
    @drink1 = Drink.new("whisky", 4)
    @drink2 = Drink.new("porter", 3)
    @drink3 = Drink.new("wine", 5)
    @pub = Pub.new("Jolly Rodger", 20, [
      @drink1, @drink2, @drink3 ]
    )
    @customer1 = Customer.new("Bob", 5, 16)
    @customer2 = Customer.new("Annabelle", 300, 78)
    @customer3 = Customer.new("Stu", 50, 50)
    @customer4 = Customer.new("Penny", 2, 21)
  end

  def test_pub_name
    assert_equal("Jolly Rodger", @pub.name)
  end

  def test_till_amount
    assert_equal(20, @pub.till)
  end

  def test_drinks_available
    assert_equal(3, @pub.drinks.count)
  end

  def test_increase_takings
    assert_equal(23, @pub.increase_takings(@drink2))
  end

  def test_is_drink_available__true
    assert_equal(@drink1, @pub.is_drink_available("whisky"))
  end

  def test_is_drink_available__false
    assert_equal(false, @pub.is_drink_available("cider"))
  end

  def test_check_age__can_buy
    assert_equal(true, @pub.check_age(@customer2))
  end

  def test_check_age__refuse
    assert_equal(false, @pub.check_age(@customer1))
  end

end




# A Pub should have a name, a till, and a collection of drinks ///
# A Drink should have a name, and a price ///
# A Customer should have a name, and a wallet ///
# A Customer should be able to buy a Drink from the Pub, reducing the money in its wallet /// and increasing the money in the Pub's till///


# Add an age to the Customer. Make sure the Pub checks the age before serving the Customer.
# Add alcohol_level to the Drink, and a drunkenness level to the Customer. Every time a Customer buys a drink, the drunkenness level should go up by the alcohol_level.
# Pub should refuse service above a certain level of drunkenness!
