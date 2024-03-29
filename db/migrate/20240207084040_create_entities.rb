class CreateEntities < ActiveRecord::Migration[7.1]
  def change
    create_table :entities do |t|
      t.references :author, null: false, foreign_key: { to_table: 'users' }
      t.string :name
      t.integer :amount
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
