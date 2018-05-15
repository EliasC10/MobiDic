# frozen_string_literal: true

class Supervisor < ApplicationRecord
  has_secure_password
  has_many :entries,
           dependent: :destroy
  belongs_to :institution

  def colleagues
    Supervisor.where(institution_id: institution_id)
  end
end
