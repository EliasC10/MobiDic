class Supervisor < ApplicationRecord
  has_many :entries,
  dependent: :destroy
  belongs_to :institution
end
