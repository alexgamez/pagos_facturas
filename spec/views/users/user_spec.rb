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
    expect(page).to have_content('Encunetra todo lo que necesites en un mismo lugar')
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
    expect(page).to have_content('Products#show')
  end



end
