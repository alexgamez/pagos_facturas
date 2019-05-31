FactoryGirl.define do
  factory :user do
    email {"usuario@gmail.com"}
    password {"password123"}
    name {"nombre_usuario"}
    role {"admin"}
  end
end
