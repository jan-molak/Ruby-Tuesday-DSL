class Order
  PRICE_LIST = {
    :shirt     => 5.60,
    :pants     => 3,
    :chocolate => 0.70,
    :jacket    => 20,
    :socks     => 2.19,
    :sofa_bed  => 319.99,
    :car       => 1000.00,
  }

  def initialize &block
    @products = {}
    instance_eval(&block) if block_given?
  end

  def add product, quantity=1
    self[product] = quantity
  end

  def total_price product
    if product.nil?

    end
  end

  def []= product, quantity
    if PRICE_LIST.keys.include?(product)
      @products[product] = (@products.keys.include?(product) && (@products[product] + quantity)) || quantity
    end
  end

  def [] product
    @products[product]
  end
end