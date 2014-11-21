# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create!(first_name: 'Sameer', last_name: 'Rahmani',
            email: 'lxsameer@gnu.org', password: '123123123')

Package.create!(name: 'test-package')
