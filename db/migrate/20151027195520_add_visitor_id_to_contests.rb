class AddVisitorIdToContests < ActiveRecord::Migration
  def change
    add_column :contests, :visitor_id, :integer 
  end
end
