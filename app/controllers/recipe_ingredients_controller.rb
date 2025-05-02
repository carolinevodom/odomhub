class RecipeIngredientsController < ApplicationController
before_action

  # GET /recipe_ingredients or /recipe_ingredients.json
  def index
    @recipe_ingredients = Ingredient.search params[:q]
  end

  # GET /recipe_ingredients/1 or /recipe_ingredients/1.json
  def show
  end

  # GET /recipe_ingredients/new
  def new
    @recipe_ingredient = RecipeIngredient.new(recipe_id: params[:recipe_id])
    @existing_recipe_ingredients = RecipeIngredient.preload(:ingredient).where(recipe_id: params[:recipe_id].to_i).to_a
  end

  # GET /recipe_ingredients/1/edit
  def edit
    @recipe_ingredient = RecipeIngredient.find(params[:id])
    @existing_recipe_ingredients = RecipeIngredient.preload(:ingredient).where(recipe_id: params[:recipe_id].to_i).to_a.reject { |ri| ri.id == @recipe_ingredient.id }

  end

  # POST /recipe_ingredients or /recipe_ingredients.json
  def create
    @recipe_ingredient = RecipeIngredient.new(refined_recipe_ingredient_params)
  

    if @recipe_ingredient.save
      redirect_to new_recipe_recipe_ingredient_path(recipe_id: @recipe_ingredient.recipe_id), notice: "Recipe Ingredient was successfully created."
    end
  end

  def create_additional
    @existing_recipe_ingredients = RecipeIngredient.where(recipe_id: params[:recipe_id])
    @recipe_ingredient = RecipeIngredient.new(refined_recipe_ingredient_params)
  end

  # PATCH/PUT /recipe_ingredients/1 or /recipe_ingredients/1.json
  def update
    respond_to do |format|
      if @recipe_ingredient.update(recipe_ingredient_params)
        format.html { redirect_to @recipe_ingredient, notice: "Recipe ingredient was successfully updated." }
        format.json { render :show, status: :ok, location: @recipe_ingredient }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe_ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_ingredients/1 or /recipe_ingredients/1.json
  def destroy
    @recipe_ingredient.destroy!

    respond_to do |format|
      format.html { redirect_to recipe_ingredients_path, status: :see_other, notice: "Recipe ingredient was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_ingredient
      @recipe_ingredient = RecipeIngredient.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def recipe_ingredient_params
      params.expect(recipe_ingredient: [ :recipe_id, :ingredient_id, :unit, :measurement ])
    end

    #do work on params to make them as expected
    def refined_recipe_ingredient_params
      refined_recipe_ingredient_params = {}
      if recipe_ingredient_params['unit'].is_a?(String)
        refined_recipe_ingredient_params['unit'] = recipe_ingredient_params['unit'].to_i
      end

      recipe_ingredient_params.merge(refined_recipe_ingredient_params)
    end
end
