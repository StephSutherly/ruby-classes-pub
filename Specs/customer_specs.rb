require('minitest/autorun')
require('minitest/rg')
require_relative('../customer.rb')
require_relative('../drinks.rb')
require_relative('../pub.rb')

class TestCustomer  < MiniTest::Test

  def setup
    @drink1 = Drink.new("whisky", 4, 30)
    @drink2 = Drink.new("porter", 3, 10)
    @drink3 = Drink.new("wine", 5, 20)
    @customer1 = Customer.new("Bob", 5, 16, 0)
    @customer2 = Customer.new("Annabelle", 300, 78, 0)
    @customer3 = Customer.new("Stu", 50, 50, 0)
    @customer4 = Customer.new("Penny", 2, 21, 0)
    @customer5 = Customer.new("Jim", 30, 21, 120)

    @pub = Pub.new("Jolly Rodger", 20, [
      @drink1, @drink2, @drink3 ]
    )
  end

  def test_customer_name
    assert_equal("Stu", @customer3.name)
  end

  def test_customer_wallet
    assert_equal(300, @customer2.wallet)
  end

  def test_customer_pays__sufficient_funds
    assert_equal(45, @customer3.customer_pays(@drink3))
  end

  def test_customer_pays__insufficient_funds
    assert_equal(2, @customer4.customer_pays(@drink1))
  end

  def test_buy_drink__can_buy
    @customer3.buy_drink(@pub, 'whisky')
    assert_equal(46, @customer3.wallet)
    assert_equal(24, @pub.till)
  end

  def test_buy_drink__cannot_buy
    @customer4.buy_drink(@pub, 'whisky')
    assert_equal(2, @customer4.wallet)
    assert_equal(20, @pub.till)
  end

  def test_buy_drink__sold_out
    @customer1.buy_drink(@pub, 'vodka')
    assert_equal(5, @customer1.wallet)
    assert_equal(20, @pub.till)
  end

  def test_change_drink_level
    assert_equal(30, @customer2.change_drink_level(@drink1))
  end

  def test_service_refused
      @customer5.buy_drink(@pub, 'whisky')
      assert_equal(120, @customer5.drunk_level)
      assert_equal(30, @customer5.wallet)
  end

end

# Add an age to the Customer. Make sure the Pub checks the age before serving the Customer.
# Add alcohol_level to the Drink, and a drunkenness level to the Customer. Every time a Customer buys a drink, the drunkenness level should go up by the alcohol_level.
# Pub should refuse service above a certain level of drunkenness!
