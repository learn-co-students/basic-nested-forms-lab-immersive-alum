class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    ingredient1 = Ingredient.new
    ingredient2 = Ingredient.new
    @recipe.ingredients = [ingredient1, ingredient2]
  end

  def create
    @recipe = Recipe.create(recipe_params)
    redirect_to recipes_path 
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title,
      ingredients_attributes: [
        :name,
        :quantity
      ]
    )
  end
end
