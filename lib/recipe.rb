class Recipe
  attr_reader :name, :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = {}
  end

  def add_ingredient(ingredient, amount)
    @ingredients_required[ingredient] = amount
  end

  def amount_required(ingredient)
    @ingredients_required[ingredient]
  end

  def ingredients
    @ingredients_required.keys
  end

  def total_calories
    @ingredients_required.inject(0) do |sum, ingredient|
      sum += ingredient[0].calories * ingredient[1]
    end
  end

  def sort_by_calories
    sorted_ingredients = @ingredients_required.sort_by do |ingredient|
      ingredient[0].calories * ingredient[1]
    end.reverse
  end

  def ingredient_breakdown
    ingredient_list = []
    sort_by_calories.each do |ingredient|
      ingredient_hash = {}
      ingredient_hash[:ingredient] = ingredient[0].name
      ingredient_hash[:amount] = "#{ingredient[1]} #{ingredient[0].unit}"
      ingredient_list << ingredient_hash
    end
    ingredient_list
  end
end
