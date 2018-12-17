class Product < ApplicationRecord

    validates :nome, presence: true, length: { maximum: 50 }
    validates :codigo, presence: true

    belongs_to :user
end
