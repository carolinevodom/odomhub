class Ingredient < ActiveRecord::Base
    enum category: { dairy: 0, meat: 1, vegetable: 2, fruit: 3, starch: 4, spice: 5, snacks: 6, other: 7 }

end
