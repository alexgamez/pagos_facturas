class Invoice < ApplicationRecord
  after_create_commit { InvoiceJob.perform_later self }  
  after_update_commit { InvoiceJob.perform_later self } 
  belongs_to :user
  has_many :concepts

  after_save :clear_redis_cache

  private

    def clear_redis_cache
      $redis.del 'invoices'
    end
end
