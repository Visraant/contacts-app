class CreateGroupCombines < ActiveRecord::Migration
  def change
    create_table :group_combines do |t|
      t.integer :contact_id
      t.integer :group_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
