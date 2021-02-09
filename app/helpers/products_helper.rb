module ProductsHelper
  def print_price(price)
    "INR #{price}"
  end
  
  def print_stock(stock)
    if stock > 0
      content_tag(:span,'In stock')
    else 
      content_tag(:span,'Sold out')
    end
  end
end
