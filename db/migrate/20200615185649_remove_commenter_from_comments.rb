class RemoveCommenterFromComments < ActiveRecord::Migration[5.0]
  def change
  	    remove_column :comments, :commenter
  end
end
