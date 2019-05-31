# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#Crear usuario admin
User.create(
  email: "admin@gmail.com",
  name: "Administrador",
  role: "admin",
  password: "password123",
  password_confirmation: "password123"
)

# Crear clientes
10.times do |i|
  User.create(
    email: "usuario_#{i}@gmail.com",
    name: "Usuario_#{i}",
    role: "client",
    password: "password123",
    password_confirmation: "password123"
  )
end
