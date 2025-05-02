class IngredientsController < ApplicationController
  layout 'application'

  # GET /ingredients or /ingredients.json
  def index
    @ingredients = Ingredient.all
  end

   # GET /recipes/search
   def search
    @ingredients = Ingredient.where(category: params[:category])

    render partial: 'ingredients/ingredient_autocomplete_element', collection: @ingredients, as: :ingredient
    
 

  # GET /ingredients/1 or /ingredients/1.json
  def show
    @ingredient = Ingredient.find(params['id'])
  end

  # GET /ingredients/new
  def new
    @ingredient = Ingredient.new
  end

  # GET /ingredients/1/edit
  def edit
  end

  # POST /ingredients or /ingredients.json
  def create
    @ingredient = Ingredient.new(refined_ingredient_params)

    respond_to do |format|
      if @ingredient.save
        format.html { redirect_to @ingredient, notice: "Ingredient was successfully created." }
        format.json { render :show, status: :created, location: @ingredient }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ingredients/1 or /ingredients/1.json
  def update
    set_ingredient
    respond_to do |format|
      if @ingredient.update(ingredient_params)
        format.html { redirect_to @ingredient, notice: "Ingredient was successfully updated." }
        format.json { render :show, status: :ok, location: @ingredient }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredients/1 or /ingredients/1.json
  def destroy
    @ingredient.destroy!

    respond_to do |format|
      format.html { redirect_to ingredients_path, status: :see_other, notice: "Ingredient was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def marked_empty
    @ingredient = Ingredient.find(params['id'])
    @ingredient.update!(marked_empty: Date.today)
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def ingredient_params
      params.expect(ingredient: [ :name, :category, :updated_by, :last_purchased, :marked_empty ])
    end

    #Do necessary conversions to ingredient params as they come in
    def refined_ingredient_params
      refined_ingredient_params = {}
      if ingredient_params['category'].is_a?(String)
        refined_ingredient_params['category'] = ingredient_params['category'].to_i
      end

      ingredient_params.merge(refined_ingredient_params)
    end
end
