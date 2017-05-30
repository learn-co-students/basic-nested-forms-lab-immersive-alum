class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.create(recipe_params)
    redirect_to recipes_path
  end


  def recipe_params
    params.require(:recipe).permit(
      :title,
      incredients_attributes: [
        :name,
        :quantity
      ]
    )
  end
end
