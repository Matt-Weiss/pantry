class Pantry
  attr_reader :stock

  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(item)
    @stock[item]
  end

  def restock(item, quantity)
    @stock[item] += quantity
  end

  def enough_ingredients_for?(recipe)
    stock_check = recipe.ingredients.collect do |ingredient|
      recipe.amount_required(ingredient) <= @stock[ingredient]
    end
    stock_check.all?
  end

end
