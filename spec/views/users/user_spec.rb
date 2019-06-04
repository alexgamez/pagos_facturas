require 'rails_helper'

describe "User", type: :feature do

  # # Redirecciona a facturas/index despues de inciar sesion como usuario admin
  # it "Redirect to invoices after login session as a admin user" do
  #   user = FactoryGirl.create(:user)
  #   visit "/users/sign_in"
  #   fill_in "user_email"  , with:  user.email
  #   fill_in "user_password" , with: user.password
  #   find("input[type='submit']").click
  #   expect(page).to have_content('Tu lista de facturas')
  # end

  # Redirecciona a productos/index despues de inciar sesion como usuario regular
  it "Redirect to products after login session as a regular user" do
    user = FactoryGirl.create(:user)
    user.role = "regular"
    user.save
    visit "/users/sign_in"
    fill_in "user_email"  , with:  user.email
    fill_in "user_password" , with: user.password
    find("input[type='submit']").click
    expect(page).to have_content('Encuentra todo lo que necesites en un mismo lugar')
  end

  # Redirecciona a inicio de sesion, si no se ha iniciado sesion aun
  it "Redirect to login, if you have not logged in yet" do
    visit "/"
    expect(page).to have_content('Inicio de sesion')
  end

  # Redirecciona a productos/index despues de inciar sesion como usuario regular y ver un producto
  let!(:product) { Product.create(name: "prueba", description: "prueba", price: 100.50) }
  it "Redirect to products/show after login session as a regular user and see a product " do
    user = FactoryGirl.create(:user)
    user.role = "regular"
    user.save
    visit "/users/sign_in"
    fill_in "user_email"  , with:  user.email
    fill_in "user_password" , with: user.password
    find("input[type='submit']").click
    click_link "Ver"
    expect(page).to have_content('Agregar al carrito')
  end


  #El usuario entra a su carrito de compras
  it "The user enters his shopping cart" do
    user = FactoryGirl.create(:user)
    user.role = "regular"
    user.save
    visit "/users/sign_in"
    fill_in "user_email"  , with:  user.email
    fill_in "user_password" , with: user.password
    find("input[type='submit']").click
    visit "/purchases"
    expect(page).to have_content('Tu carrito de compras')
  end

  # Usuario paga su carrito de comrpas
  it "The user pay his/her shopping cart" do
    user = FactoryGirl.create(:user)
    user.role = "regular"
    user.save
    visit "/users/sign_in"
    fill_in "user_email"  , with:  user.email
    fill_in "user_password" , with: user.password
    find("input[type='submit']").click

    visit "/purchases"

    #session[:user_id] = nil
    #session[:shopping_cart] = [{ "product_name" => "Producto 1", "product_quantity" => 3, "product_price" => 300.50 }]
    expect(page).to have_content('Tu carrito de compras')
  end


  # no puede pagar sin seleccionar metodo de pago
  #
  #

end
