class PurchasesController < ApplicationController
  def index
    # session.delete(:shopping_cart)
    @purchases = session[:shopping_cart] || []
  end
end
