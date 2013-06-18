class AddRecipeToComment < ActiveRecord::Migration
  def change
    add_column :comments, :recipe_id, :integer
  end
end
