class Producto < ApplicationRecord

     validates :name, presence: true
     validates :description, presence: true
     validates :stock, presence: true
     validates :price, presence: true

end
