module InvoicesHelper
  def fetch_invoices_redis

    # Esta línea solicita redis-server para aceptar cualquier valor asociado con la clave de facturas
    invoices = $redis.get("invoices")

    # esta condición se ejecutará si alguna factura no está disponible en el servidor redis
    if invoices.nil?
      invoices = Invoice.all.to_json
      $redis.set("invoices",invoices)
      $redis.expire("invoices",5.minutes.to_i)
    end

    # Esto convertirá los datos JSON a Ruby Hash
    JSON.load invoices
  end
end
