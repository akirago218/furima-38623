class OrderBuyer
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)" }
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A[0-9]{10,11}\z/, length: { minimum: 10, maximum: 11 } }
    validates :token
  end

  def save
    order = Order.create(user_id, item_id: item_id)
    Buyer.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end