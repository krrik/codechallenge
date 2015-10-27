class CreateContests < ActiveRecord::Migration
  def change
    create_table :contests do |t|
      t.string :img_name
      t.string :img_summary
      t.string :img_description
      t.timestamps 
    end
  end
end
