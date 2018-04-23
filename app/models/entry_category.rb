class EntryCategory < ApplicationRecord
  belongs_to :entry
  belongs_to :category
end
