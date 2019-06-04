class PurchasesController < ApplicationController
  def index
    # session.delete(:shopping_cart)
    @purchases = session[:shopping_cart] || []
  end

  def pay_with_spei

    target = params[:tarjeta]
    key = params[:codigo]

    total_payment = 0
    session[:shopping_cart].each do |purchase|
      total_payment += purchase['product_quantity'].to_i*purchase['product_price'].to_f
    end

    # Genera factura
    invoice = Invoice.create(creation_date:Date.today,  end_date:Date.today, total: total_payment, user_id: current_user.id, status:"pagada")

    # Genera concepto
    session[:shopping_cart].each do |purchase|
      product_id = Product.find_by_name(purchase['product_name']).id
      Concept.create(quantity:purchase['product_quantity'].to_i, invoice_id:invoice.id, product_id: product_id )
    end

    # Vacia carrito
    session.delete(:shopping_cart)

    # Genera Pago
    Payment.create(payment_date:Date.today, penalty:0.0, invoice_id:invoice.id, card_number:target ,form_of_pay: "spei")

    respond_to do |format|
      format.json { render json: 1 }
      format.js
    end
  end

  def pay_per_window
    total_payment = 0
    session[:shopping_cart].each do |purchase|
      total_payment += purchase['product_quantity'].to_i*purchase['product_price'].to_f
    end

    # Genera factura
    invoice = Invoice.create(creation_date:Date.today,  end_date:Date.today + 2.day, total: total_payment, user_id: current_user.id, status:"pendiente")

    # Genera concepto
    session[:shopping_cart].each do |purchase|
      product_id = Product.find_by_name(purchase['product_name']).id
      Concept.create(quantity:purchase['product_quantity'].to_i, invoice_id:invoice.id, product_id: product_id )
    end

    dias_atraso = rand(0..30)
    multa = (14.2857 * rand(0..30).to_i )
    fecha_pago = Date.today + dias_atraso.day

    # Genera Pago
    payment = Payment.create(payment_date:fecha_pago, penalty: multa, invoice_id:invoice.id, card_number:nil ,form_of_pay: "ventanilla")

    # Vacia carrito
    session.delete(:shopping_cart)

    #InvoiceJobJob.set(wait: 1.day).perform_later(invoice.id)
    InvoiceJobJob.set(wait: 1.minute).perform_later(invoice.id)

    respond_to do |format|
      format.json { render json: payment}
      format.js
    end
  end
end
