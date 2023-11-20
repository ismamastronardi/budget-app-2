class CreateEntityGroupJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_table :entities_groups do |t|
      t.belongs_to :group
      t.belongs_to :entity

      t.timestamps
    end
  end
end
