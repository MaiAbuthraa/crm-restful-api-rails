class CreateContactsTable < ActiveRecord::Migration[6.0]
  def up
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.references :customer, index: true, foreign_key: true
      t.integer :created_by_id, index: true
      t.timestamps
    end

    add_foreign_key :contacts, :users, column: :created_by_id
  end

  def down
    remove_reference :contacts, :customer, index: true

    remove_foreign_key :contacts, :users, column: :created_by_id
    drop_table :contacts
  end
end
