json.extract! ingredient, :id, :name, :category, :updated_by, :last_purchased, :marked_empty, :created_at, :updated_at
json.url ingredient_url(ingredient, format: :json)
