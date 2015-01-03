require 'faker'

FactoryGirl.define do
  factory :package_params, class: 'Package' do
    name Faker::App.name
    version Faker::App.version
    description Faker::Lorem.paragraph
  end
end
