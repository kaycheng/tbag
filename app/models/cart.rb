class Cart
  attr_reader :items

  def initialize
    @items = []
  end
  
  def add_item(product_id)
    found = items.find { |item| item.product_id == product_id}
    
    if found
      found.increment!
    else
      @items << CartItem.new(product_id)
    end
  end

  def empty?
    @items.empty?
  end

  def total_price
    # total = 0
    # @items.each { |item| total = total + item.total_price }
    # p total

    @items.reduce(0) {|sum, item| sum + item.total_price}
  end

  def serialize
    items = @items.map { |item| {"product_id" => item.product_id, 
                                 "quantity" => item.quantity} } 
    { "items" => items }
  end
end