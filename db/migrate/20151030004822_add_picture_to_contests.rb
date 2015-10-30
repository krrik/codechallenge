class AddPictureToContests < ActiveRecord::Migration
  def change
    add_column :contests, :picture, :string
  end
end
