class InvoiceJob < ApplicationJob
  queue_as :default

  def perform(invoice)
    ActionCable.server.broadcast 'invoice_channel', item: render(invoice)
  end

  private
    def render(invoice)
      ApplicationController.renderer.render(partial: 'invoices/invoice', locals: {invoice: invoice})
    end
end
