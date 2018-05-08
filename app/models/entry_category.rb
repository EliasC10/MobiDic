# frozen_string_literal: true

class EntryCategory < ApplicationRecord
  belongs_to :entry
  belongs_to :category
end
