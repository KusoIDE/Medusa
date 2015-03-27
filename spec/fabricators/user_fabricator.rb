passwd = Faker::Internet.password(10, 20)

Fabricator :user do
  first_name             { Faker::Name.name }
  last_name              { Faker::Name.name }
  password               { passwd }
  password_confirmation  { passwd }
  email { sequence(:email) { |n| "somename#{n}@example.com" } }
end
