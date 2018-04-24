class CreateClientEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :client_entries do |t|
      t.integer :client_id
      t.integer :entry_id

      add_foreign_key :client_entries, :clients, column: :client_id, primary_key: "lng_id"
      add_foreign_key :client_entries, :entries, column: :entry_id, primary_key: "lng_id"

      t.timestamps
    end
  end
end
