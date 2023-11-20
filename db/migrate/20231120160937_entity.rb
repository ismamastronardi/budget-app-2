class Entity < ActiveRecord::Migration[7.1]
  def change
    create_table :entities do |t|
      t.string :name
      t.decimal :amount
      t.references :author_id, foreign_key: { to_table: :users }, index: true
      t.timestamps
    end
  end
end
