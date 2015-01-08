require 'faker'

FactoryGirl.define do
  factory :package do
    name Faker::App.name
    version Faker::App.version
    description Faker::Lorem.paragraph

    factory :package_without_name do
      name nil
    end

    factory :package_without_version do
      version nil
    end

    factory :package_without_description do
      description nil
    end

  end
end
