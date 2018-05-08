# frozen_string_literal: true

class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.date :date_of_birth
      t.integer :institution_id

      add_foreign_key :clients, :institutions, column: :institution_id, primary_key: 'lng_id'

      t.timestamps
    end
  end
end
