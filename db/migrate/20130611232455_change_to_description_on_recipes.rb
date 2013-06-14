class ChangeToDescriptionOnRecipes < ActiveRecord::Migration
  def change
    rename_column :recipes, :steps, :description
  end
end
