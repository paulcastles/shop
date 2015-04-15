class Item < ActiveRecord::Base
  has_many :line_items
  has_many :comments
  has_many :orders, through: :line_items
  mount_uploader :picture, PictureUploader
  before_destroy :ensure_not_referenced_by_any_line_item
  
 

  private

  #Ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
   end
  end
  
  def self.search(manufacturer, category)
      if manufacturer.present? && category.present?    
        where("manufacturer like ?", "%#{manufacturer}%") && where( "category like ?", "%#{category}%") 
    elsif manufacturer.present?
            where("manufacturer like ?", "%#{manufacturer}%")
    elsif category.present?
            where( "category like ?", "%#{category}%")
      end
  end
end
