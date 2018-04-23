class CreateSupervisors < ActiveRecord::Migration[5.1]
  def change
    create_table :supervisors do |t|
      t.string :name
      t.string :password
      t.integer :institution_id

      t.timestamps
    end
  end
end
