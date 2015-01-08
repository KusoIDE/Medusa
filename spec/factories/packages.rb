require 'faker'

FactoryGirl.define do
  factory :package do
    name Faker::App.name
    version Faker::App.version
    description Faker::Lorem.paragraph

    factory :package_without_name do
      name nil
    end

  end
end
