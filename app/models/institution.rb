# frozen_string_literal: true

class Institution < ApplicationRecord
  has_many :supervisors,
           dependent: :destroy

  has_many :clients,
           dependent: :destroy
end
