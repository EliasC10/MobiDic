# frozen_string_literal: true

class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.timestamp :timestamp
      t.text :text
      t.integer :supervisor_id

      add_foreign_key :entries, :supervisors, column: :supervisor_id, primary_key: 'lng_id'

      t.timestamps
    end
  end
end
