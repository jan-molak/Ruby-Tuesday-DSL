require "rspec"

$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/../")

require 'lib/order.rb'

describe Order do
  it "should add a new product to the order" do

    order = Order.new do
      add :shirt, 2
    end

    order[:shirt].should == 2
  end

  it "should default the quantity to 1, if it's not provided" do
    order = Order.new do
      add :shirt
    end

    order[:shirt].should == 1
  end

  it "should increase the quantity of a product" do
    order = Order.new do
      add :shirt, 2
      add :shirt, 3
    end

    order[:shirt].should == 5
  end

  it "should calculate the total price" do
    order = Order.new do
      add :pants
      add :jacket
    end

    order.total_price.should == 3+20 # get from the PRICE_LIST
  end

  it "should calculate the total price of a given product on the order" do
    order = Order.new do
      add :pants
      add :pants, 3
      add :jacket
    end

    order.total_price(:pants).should == 4 * 3 # get from the PRICE_LIST
  end

  it "should return a total price of 0 for a product that's not on the order" do
    order = Order.new
    order.total_price(:pants).should == 0
  end



end