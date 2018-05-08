# frozen_string_literal: true

class ClientEntry < ApplicationRecord
  belongs_to :client
  belongs_to :entry
end
