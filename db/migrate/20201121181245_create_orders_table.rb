class CreateOrdersTable < ActiveRecord::Migration[6.0]
  def up
    create_table :orders do |t|
      t.references :customer, index: true, foreign_key: true
      t.integer :created_by_id, index: true
      t.integer :status
      t.boolean :active, default: true
      t.text :description
      t.timestamps
    end

    add_foreign_key :orders, :users, column: :created_by_id
  end

  def down
    remove_reference :orders, :customer, index: true, foreign_key: true 
    remove_foreign_key :orders, :users, column: :created_by_id
    drop_table :orders
  end
end
