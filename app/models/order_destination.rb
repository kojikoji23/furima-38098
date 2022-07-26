class OrderDestination
  include ActiveModel::Model
  attr_accessor :zip, :prefecture_id, :city, :address, :building, :tel, :user_id, :item_id, :token

  with_options presence: true do
    validates :city, :address, :user_id, :item_id, :token
    validates :zip, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :tel, format: { with: /\A\d{10}$|^\d{11}\z/, message: 'is invalid' }
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    destination = Destination.create(zip: zip, prefecture_id: prefecture_id, city: city, address: address, building: building, tel: tel, order_id: order.id)
  end
end