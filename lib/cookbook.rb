class CookBook
  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def summary
    summary_array = []
    @recipes.each do |recipe|
      recipe_hash = {}
      recipe_hash[:name] = recipe.name
      recipe_hash[:details] = {ingredients: recipe.ingredient_breakdown,
                               total_calories: recipe.total_calories}
      summary_array << recipe_hash
    end
    summary_array
  end

end
