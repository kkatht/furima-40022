FactoryBot.define do
  factory :shipping_address do
    postal_code       {Faker::Number.leading_zero_number(digits: 3) + '-' + Faker::Number.leading_zero_number(digits: 4)}
    prefecture_id     {Faker::Number.between(from: 1, to:47)}
    city              {Faker::Address.city}
    address           {Faker::Address.street_address}
    building          {Faker::Company.name}
    phone_number      {Faker::Number.between(from: 1000000000, to:99999999999)}
    # user_id              {'2'}
    # order_id           {'2'}
    # association :order
    #----------------20240327 orderファクトリを作ってから実装
    after(:build) do |shipping_address|
      user = create(:user)
      item = create(:item, user: user)
      shipping_address.order = create(:order, item: item, user: user)
    end    
  end
end
