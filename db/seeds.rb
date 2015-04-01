# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'
require 'base64'

pkg_file = "#{Rails.root}/spec/fixtures/sample_pkg.tar"
package_data_hash = { 'filename' =>  'sample_pkg.tar',
  'content_type' => 'application/x-tar',
  'data' => Base64.strict_encode64(File.read(pkg_file))
}


if User.count == 0
  User.create!(first_name: 'Sameer', last_name: 'Rahmani',
               email: 'lxsameer@gnu.org', password: '123123123')
end

1.upto 40 do
  Fabricate(:stored_package)
end

Package.all.each do |package|
  package.version = Faker::App.version
  package.dependencies = {'elib' => '1.0.0'}
  package.development_dependencies = {}
  package.package_data = package_data_hash
  package.save
end
