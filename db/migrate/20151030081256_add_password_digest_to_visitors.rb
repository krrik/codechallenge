class AddPasswordDigestToVisitors < ActiveRecord::Migration
  def change
    add_column :visitors, :password_digest, :string
  end
end
