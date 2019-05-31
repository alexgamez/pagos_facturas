FactoryGirl.define do
  factory :product do
    name {"Producto 1"}
    description {"Una descripcion detallada sobre el producto 1"}
    price {rand(48.50...2750)}
  end
end
