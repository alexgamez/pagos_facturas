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
    role: "regular",
    password: "password123",
    password_confirmation: "password123"
  )
end

100.times do |i|
  description_aux  = "Descrip del Producto #{i} "*6
  Product.create( name: "Prodcuto #{i}", description: description_aux, price: rand(48.50...2750)  )
end

20.times do |i|

  total_payment = 0
  Product.all.limit(20).each do |product|
    total_payment += 3 * product.price
  end

  # Genera factura
  invoice = Invoice.create(creation_date:Date.today,  end_date:Date.today, total: total_payment, user_id: User.last.id, status:"pagada")

  # Genera concepto
  Product.all.limit(20).each do |product|
    Concept.create(quantity:3 , invoice_id:invoice.id, product_id: product.id )
  end

  # Genera Pago
  Payment.create(payment_date:Date.today, penalty:0.0, invoice_id:invoice.id, card_number:1234567890123456 ,form_of_pay: "spei")

end
