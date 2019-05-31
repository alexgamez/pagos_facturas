require 'rails_helper'

RSpec.describe Product, type: :model do

  # Un producto no debe tener datos en blanco
  it "A product should not have blank data" do
    product = Product.new()
    expect(product.save).to eq(false)
  end

  # Un producto debe tener precio
  it "A product must have a price" do
    product = Product.new(name: "Producto 1", description: "Una descripcion detallada sobre el producto 1")
    expect(product.save).to eq(false)
  end

  # Un producto debe tener nombre
  it "A product must have a name" do
    product = Product.new( price: 1200.50, description: "Una descripcion detallada sobre el producto 1")
    expect(product.save).to eq(false)
  end

  # Un producto debe tener descripcion
  it "A product must have description" do
    product = Product.new(name: "Producto 1", price: 1200.50)
    expect(product.save).to eq(false)
  end

  # La descripcion del producto no debe tener mas de 140 caracteres
  it "The description of the product must not have more than 140 characters" do
    product = Product.new( name: "Producto 1", price: 100.00, description: "Lorem ipsum dolor sit amet, quam morbi nostrum sed elit nibh vestibulum, elementum imperdiet euismod venenatis et tellus ac, iaculis iaculis augue amet sodales penatibus dapibus. Et magna ut vitae torquent libero, magna a volutpat rutrum urna eleifend, at pellentesque quis fusce nulla risus fringilla, mus erat vivamus ullamcorper odio risus officiis, nec quis nunc ultrices libero id semper.")
    expect(product.save).to eq(false)
  end

  # El precio del producto no puede ser igual a cero
  it "The price of the product can not be equal to zero" do
    product = Product.new( name: "Producto 1", price: 0.00, description: "Una descripcion detallada sobre el producto 1")
    expect(product.save).to eq(false)
  end

  # El precio del producto no puede ser negativo
  it "The price of the product can not be negative" do
    product = Product.new( name: "Producto 1", price: -10, description: "Una descripcion detallada sobre el producto 1")
    expect(product.save).to eq(false)
  end
end
