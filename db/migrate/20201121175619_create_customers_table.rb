class CreateCustomersTable < ActiveRecord::Migration[6.0]
  def up
    create_table :customers do |t|
      t.string :name
      t.string :company_name
      t.integer :category
      t.integer :created_by_id, index: true
      t.boolean :active, default: true
      t.timestamps
    end

    add_foreign_key :customers, :users, column: :created_by_id
  end

  def down
    remove_foreign_key :customers, :users, column: :created_by_id
    drop_table :customers
  end
end
