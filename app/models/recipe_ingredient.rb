class RecipeIngredient < ApplicationRecord
	enum :unit, [:teaspoon, :tablespoon, :cup, :ounce, :pound, :gram, :liter, :milliliter, :unit]
	belongs_to :recipe
	belongs_to :ingredient

	def ingredient_name
		ingredient.try(:name)
	end

	def ingredient_name=(name)
		self.ingredient = Ingredient.find_by(name: name) if name.present?
	end
end
