class Product < ApplicationRecord
  # Nombre, descripcion y precio  siempre son necesarios
  # description no debe tener mas de 140 carcteres
  # precio debe ser positivo
  validates :name, presence: true
  validates :description, presence: true, length: {maximum: 140}
  validates :price, presence: true, :numericality => { :greater_than => 0 }
end
