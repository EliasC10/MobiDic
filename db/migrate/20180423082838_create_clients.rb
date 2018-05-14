# frozen_string_literal: true

class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.date :date_of_birth
      t.integer :institution_id
      t.timestamps
    end
  end
end
