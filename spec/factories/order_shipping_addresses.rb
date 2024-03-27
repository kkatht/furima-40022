FactoryBot.define do
  factory :order_shipping_address do
    postal_code       {Faker::Number.leading_zero_number(digits: 3) + '-' + Faker::Number.leading_zero_number(digits: 4)}
    prefecture_id     {Faker::Number.between(from: 1, to:47)}
    city              {Faker::Address.city}
    address           {Faker::Address.street_address}
    building          {Faker::Company.name}
    phone_number      {Faker::Number.between(from: 1000000000, to:99999999999)}
    token             {'tk11111111111111'}

    #after(:build) do |order_shipping_address|
    #  user = create(:user)
    #  item = create(:item, user: user)
    #  order_shipping_address.order = create(:order, item: item, user: user)
    #end   
  end
end
