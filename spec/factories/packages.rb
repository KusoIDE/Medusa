require 'faker'
require 'base64'

pkg_file = "#{Rails.root}/spec/fixtures/sample_pkg.tar"
package_data = { filename: 'sample_pkg.tar',
                 content_type: 'application/x-tar',
                 data: Base64.strict_encode64(File.read(pkg_file))
               }

FactoryGirl.define do
  factory :package do
    name Faker::App.name
    versions({ '1.0.0' => 0 })
    description Faker::Lorem.paragraph
    packages { { '1.0.0' => "#{name}/#{name}-#{versions.keys[0]}.tar" }  }
  end

  factory :package_params, :class => 'Package' do
    name Faker::App.name
    version Faker::App.version
    description Faker::Lorem.paragraph
    package package_data
    dependencies []
    dev_dependencies []

    home_page         Faker::Internet.url
    documentation_url Faker::Internet.url
    download_url      Faker::Internet.url
    bug_tracker_url   Faker::Internet.url
    wiki_url          Faker::Internet.url
    source_code_url   Faker::Internet.url

    authors [{ first_name: Faker::Name.name, last_name: Faker::Name.name,
               email: Faker::Internet.email }]
    owners [{ email: Faker::Internet.email }]

    factory :package_without_name do
      name nil
    end

    factory :package_without_version do
      version nil
    end

    factory :package_without_description do
      description nil
    end

    factory :package_without_package do
      package nil
    end

  end
end
