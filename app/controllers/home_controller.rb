class HomeController < ApplicationController
  def index
    if user_signed_in?
      if current_user.role == "admin"
        redirect_to invoices_path
      else
        redirect_to products_path
      end
    else
      redirect_to user_session_path
    end
  end
end
