# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Role creation
admin_role = Role.create(name: 'admin')
Role.create(name: 'developer')

# Admin creation
user = User.new(
  email: 'admin@manager.com',
  password: 'qwerty.123',
  password_confirmation: 'qwerty.123',
  role_ids: [admin_role.id]
)

puts 'Admin created' if user.save
