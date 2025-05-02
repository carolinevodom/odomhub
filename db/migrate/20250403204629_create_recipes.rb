class CreateRecipes < ActiveRecord::Migration[8.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
