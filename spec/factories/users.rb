passwd = Faker::Internet.password(10, 20)

FactoryGirl.define do
  factory :user do
    first_name             Faker::Name.name
    last_name              Faker::Name.name
    password               passwd
    password_confirmation  passwd
    sequence :email do |n|
      "somename#{n}@example.com"
    end
  end
end
