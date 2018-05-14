# frozen_string_literal: true

class CreateSupervisors < ActiveRecord::Migration[5.1]
  def change
    create_table :supervisors do |t|
      t.string :name
      t.string :password_digest
      t.integer :institution_id
      t.timestamps
    end
  end
end
