class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :order
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :payer
  belongs_to :prefecture
  belongs_to :shipping_day

  validates :name, presence: true
  validates :content, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :payer_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_day_id, numericality: { other_than: 1 , message: "can't be blank"}
  VALID_PRICEL_HALF = /\A[0-9]+\z/
  validates :price, presence: true, format: {with: VALID_PRICEL_HALF},numericality: { only_integer: true, greater_than: 299, less_than: 10000000}
  validates :image, presence: true
end
