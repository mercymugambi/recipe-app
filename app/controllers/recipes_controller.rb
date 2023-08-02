class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1 or /recipes/1.json
  def show
    @recipeshow = Recipe.find(params[:id])
    @recipe_food = @recipe.recipe_foods.find(params[:id])
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit; end

  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully created.' }
        # Remove the format.json block to remove JSON response
      else
        format.html { render :new, status: :unprocessable_entity }
        # Remove the format.json block to remove JSON response
      end
    end
  end

  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/:id
  def destroy
    @recipe = Recipe.find(params[:id])

    # Ensure that the user is authorized to delete the recipe
    if @recipe.user_id_id == current_user.id
      @recipe.destroy
      respond_to do |format|
        format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      end
    else
      respond_to do |format|
        format.html { redirect_to recipes_url, alert: 'You do not have permission to delete this recipe.' }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public, :user_id_id)
  end
end
