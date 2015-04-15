class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  
  def add_item(item_id)
    current_item = line_items.find_by(item_id: item_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(item_id: item_id)
    end
    current_item
  end
  
  def total_price
    line_items.to_a.sum { |line_item| line_item.total_price }
  end
end

