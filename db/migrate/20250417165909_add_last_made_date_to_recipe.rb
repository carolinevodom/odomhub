class AddLastMadeDateToRecipe < ActiveRecord::Migration[8.0]
  def change
    add_column :recipes, :last_made, :date
  end
end
