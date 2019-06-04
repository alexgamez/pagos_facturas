class InvoiceJobJob < ApplicationJob
  queue_as :default

  def perform(invoice_id)
    Invoice.find(invoice_id).update(status:"pagada")
  end
end
