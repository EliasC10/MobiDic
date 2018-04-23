class CreateClientEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :client_entries do |t|
      t.integer :client_id
      t.integer :entry_id

      t.timestamps
    end
  end
end
