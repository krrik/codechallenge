class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.boolean :like
      t.integer :visitor_id, :contest_id
      t.timestamps
    end
  end
end
