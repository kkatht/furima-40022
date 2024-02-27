class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shipping_fee_status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery
  has_one_attached :image

  validates :info, :name, :image, presence: true

  with_options presence: true, format: { with: /\A[0-9]+\Z/ } do
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      presence: {message: "can't be blank"}
  end


  validates :category_id, numericality: { other_than: 0 } 
  validates :prefecture_id, numericality: { other_than: 0 } 
  validates :sales_status_id, numericality: { other_than: 0 } 
  validates :shipping_fee_status_id, numericality: { other_than: 0 } 
  validates :scheduled_delivery_id, numericality: { other_than: 0 } 
end
