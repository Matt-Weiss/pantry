require './test/test_helper'

class RecipeTest < Minitest::Test

  def test_it_exists
    recipe = Recipe.new("Mac and Cheese")
    assert_instance_of Recipe, recipe
  end

  def test_we_can_access_name
    mac_and_cheese = Recipe.new("Mac and Cheese")
    assert_equal "Mac and Cheese", mac_and_cheese.name
  end

  def test_ingredients_required_starts_as_empty_hash
    mac_and_cheese = Recipe.new("Mac and Cheese")
    assert_equal ({}), mac_and_cheese.ingredients_required
  end

  def test_we_can_add_ingredients
    cheese = Ingredient.new("Cheese", "C", 100)
    mac = Ingredient.new("Macaroni", "oz", 30)
    mac_and_cheese = Recipe.new("Mac and Cheese")
    mac_and_cheese.add_ingredient(cheese, 2)
    mac_and_cheese.add_ingredient(mac, 8)
    expected = {cheese => 2, mac => 8}
    assert_equal expected, mac_and_cheese.ingredients_required
  end

  def test_we_can_access_each_amount_required
    cheese = Ingredient.new("Cheese", "C", 100)
    mac = Ingredient.new("Macaroni", "oz", 30)
    mac_and_cheese = Recipe.new("Mac and Cheese")
    mac_and_cheese.add_ingredient(cheese, 2)
    mac_and_cheese.add_ingredient(mac, 8)
    assert_equal 2, mac_and_cheese.amount_required(cheese)
    assert_equal 8, mac_and_cheese.amount_required(mac)
  end

  def test_we_can_access_ingredient_objects_required
    cheese = Ingredient.new("Cheese", "C", 100)
    mac = Ingredient.new("Macaroni", "oz", 30)
    mac_and_cheese = Recipe.new("Mac and Cheese")
    mac_and_cheese.add_ingredient(cheese, 2)
    mac_and_cheese.add_ingredient(mac, 8)
    assert_equal [cheese, mac], mac_and_cheese.ingredients
  end

  def test_we_can_access_total_calories
    cheese = Ingredient.new("Cheese", "C", 100)
    mac = Ingredient.new("Macaroni", "oz", 30)
    mac_and_cheese = Recipe.new("Mac and Cheese")
    mac_and_cheese.add_ingredient(cheese, 2)
    mac_and_cheese.add_ingredient(mac, 8)
    assert_equal 440, mac_and_cheese.total_calories
  end

  def test_we_can_sort_items_by_calories
    cheese = Ingredient.new("Cheese", "C", 100)
    mac = Ingredient.new("Macaroni", "oz", 30)
    mac_and_cheese = Recipe.new("Mac and Cheese")
    mac_and_cheese.add_ingredient(cheese, 2)
    mac_and_cheese.add_ingredient(mac, 8)
    expected = [[mac, 8], [cheese, 2]]
    assert_equal expected, mac_and_cheese.sort_by_calories
  end

  def test_we_can_get_an_array_of_hashes_detailing_ingredients
    cheese = Ingredient.new("Cheese", "C", 100)
    mac = Ingredient.new("Macaroni", "oz", 30)
    mac_and_cheese = Recipe.new("Mac and Cheese")
    mac_and_cheese.add_ingredient(cheese, 2)
    mac_and_cheese.add_ingredient(mac, 8)
    expected = [{:ingredient=>"Macaroni", :amount=>"8 oz"},
                {:ingredient=>"Cheese", :amount=>"2 C"}]
    assert_equal expected, mac_and_cheese.ingredient_breakdown
  end

end
