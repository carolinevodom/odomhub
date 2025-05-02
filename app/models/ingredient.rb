class Ingredient < ActiveRecord::Base
	enum :category, [:dairy, :meat, :vegetable, :fruit, :starch, :spice, :snacks, :other] 

	#Validations

	validates :name, presence: true, uniqueness: true
	validates :category, presence: true, inclusion: { in: categories.keys }

	def to_combobox_display
		name
	end
end
