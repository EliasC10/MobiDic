class Client < ApplicationRecord
  has_many :client_entries,
  dependent: :destroy
  belongs_to :institution
end
