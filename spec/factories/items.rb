FactoryBot.define do
  factory :item do
    name                   {Faker::Lorem.sentence(word_count: 3)}
    price                  {Faker::Number.between(from: 300, to:9999999)}
    category_id            {Faker::Number.between(from: 1, to:10)}
    sales_status_id        {Faker::Number.between(from: 1, to:6)}
    shipping_fee_status_id {Faker::Number.between(from: 1, to:2)}
    prefecture_id          {Faker::Number.between(from: 1, to:47)}
    scheduled_delivery_id  {Faker::Number.between(from: 1, to:3)}
    info                   {Faker::Lorem.paragraph}
    association :user
    after(:build) do |item|
      item.image.attach(
        io: File.open(Rails.root.join('spec', 'fixtures', 'sample_image.jpg')),
        filename: 'sample_image.jpg',
        content_type: 'image/jpeg'
      )
    end
  end
end
