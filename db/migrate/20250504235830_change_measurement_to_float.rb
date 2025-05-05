class ChangeMeasurementToFloat < ActiveRecord::Migration[8.0]
  def change
    change_column :recipe_ingredients, :measurement, :float
  end
end
