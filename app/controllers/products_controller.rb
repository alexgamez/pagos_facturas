class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    # session.delete(:shopping_cart)
  end

  def add_to_shopping_cart
    # Parametros
    product_name = params[:name]
    product_price = params[:priece]
    product_quantity = params[:quantity]

    # Revisa si el carro de compra esta vacio
    # Agrega la compra
    if session[:shopping_cart].nil?
      session[:shopping_cart] = { product_name => [product_quantity, product_price] }
    else
      # Si se compro un producto de nuevo, sustituye los datos
      # if !session[:shopping_cart][product_name].nil?
        session[:shopping_cart][product_name] = [product_quantity, product_price]
      # else

      # end
    end
    puts session[:shopping_cart]
    respond_to do |format|
      format.json { render json: session[:shopping_cart][product_name] }
      format.js
    end
  end
end
