FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 5,mix_case: false)+'1'}
    password_confirmation {password}
    last_name             {'田中'}
    first_name            {'太郎'}
    last_name_kana        {'タナカ'}
    first_name_kana       {'タロウ'}
    birth_date            {'2000-02-02'}
  end
end