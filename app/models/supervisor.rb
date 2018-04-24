class Supervisor < ApplicationRecord
  has_secure_password
  has_many :entries,
  dependent: :destroy
  belongs_to :institution
end
