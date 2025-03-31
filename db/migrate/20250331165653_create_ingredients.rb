class CreateIngredients < ActiveRecord::Migration[8.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :category
      t.integer :updated_by
      t.date :last_purchased
      t.date :marked_empty

      t.timestamps
    end
  end
end
