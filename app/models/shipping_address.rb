class ShippingAddress < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :order
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :order_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "must be other than 0"}
  validates :phone_number, presence: true, format: {with: /\A\d{10,11}\z/, message: "is invalid. "}
  validates :city, :address, presence: true



end
