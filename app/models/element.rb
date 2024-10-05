class Element < ApplicationRecord
  has_many :ionization_energies, dependent: :destroy
  has_many :shells, dependent: :destroy
  has_one :order, dependent: :destroy
end
