module Shop
  PRICE_LIST = {
    :shirt     => 5.60,
    :pants     => 3,
    :chocolate => 0.70,
    :jacket    => 20,
    :socks     => 2.19,
    :sofa_bed  => 319.99,
    :car       => 1000.00,
  }

  class Order

    def initialize &block
      @products = {}
      instance_eval(&block) if block_given?
    end

    def add product, quantity=1
      self[product] = quantity
    end

    def []= product, quantity
      if PRICE_LIST.keys.include?(product)
        @products[product] = (@products.keys.include?(product) && (@products[product] + quantity)) || quantity
      end
    end

    def [] product
      @products[product] unless @products[product].nil?
    end

    def total_price product=nil
      total = 0
      if product.nil?
        @products.each { |product, quantity| total += quantity * PRICE_LIST[product] }
      else
        total = self[product] * PRICE_LIST[product] unless self[product].nil?
      end

      total
    end

    def print_receipt
      @products.each do |product, quantity|
        puts "#{"#{product} (#{quantity}x)".ljust(20, " ")} - #{"#{total_price product}".rjust(6, " ")}"
      end

      puts "".ljust(29, "-")
      puts "#{"Total:".ljust(20, " ")} #{"#{total_price}".rjust(8, " ")}"
    end

  end
end