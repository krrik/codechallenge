class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.string :visitorname
      t.string :email
      t.string :mail
      t.integer :phone
      t.integer :zip
      t.timestamps
    end
  end
end
