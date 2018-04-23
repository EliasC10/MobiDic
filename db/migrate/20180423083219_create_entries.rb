class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.timestamp :timestamp
      t.text :text
      t.integer :supervisor_id

      t.timestamps
    end
  end
end
