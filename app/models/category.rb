class Category < ApplicationRecord
  has_many :entry_categories,
  dependent: :destroy
end
