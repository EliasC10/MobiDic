class Entry < ApplicationRecord
  has_many :client_entries,
  dependent: :destroy
  has_many :entry_categories,
  dependent: :destroy
  belongs_to :supervisor
end
