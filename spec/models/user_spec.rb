require 'rails_helper'

RSpec.describe User, type: :model do

  # No debería guardarse un usuario con datos en blanco
  it "A user with blank data should not be saved" do
    user = User.new()
    expect(user.save).to eq(false)
  end

  # No debería guardarse un usuario con rol en blanco
  it "A user with a blank role should not be saved" do
    user = User.new(email:"usuario2@gmail.com", password: "prueba001", password_confirmation: "prueba001", name: "user" )
    expect(user.save).to eq(false)
  end

  # No debería guardarse un usuario con nombre en blanco
  it "A user with a blank name should not be saved" do
    user = User.new(email:"usuario2@gmail.com", password: "prueba001", password_confirmation: "prueba001", role: "adm" )
    expect(user.save).to eq(false)
  end

end
