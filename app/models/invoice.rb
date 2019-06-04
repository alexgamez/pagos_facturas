class Invoice < ApplicationRecord
  belongs_to :user
  has_many :concepts

  after_save :clear_redis_cache

  private

    def clear_redis_cache
      $redis.del 'invoices'
    end
end
