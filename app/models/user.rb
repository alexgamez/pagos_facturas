class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Nombre y rol siempre son necesarios
  validates :role, presence: true
  validates :name, presence: true

  has_many :invoices
end
