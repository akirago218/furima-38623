class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :payer
  belongs_to :prefecture
  belongs_to :shipping_day

end
