require './test/test_helper'

class PantryTest < Minitest::Test

  def test_it_exists
    pantry = Pantry.new
    assert_instance_of Pantry, pantry
  end

  def test_pantry_stock_starts_empty
    pantry = Pantry.new
    assert_equal ({}), pantry.stock
  end

  def test_non_stock_item_returns_0
    pantry = Pantry.new
    cheese = Ingredient.new("Cheese", "C", 50)
    assert_equal 0, pantry.stock_check(cheese)
  end

  def test_we_can_stock_items_and_check_stock
    pantry = Pantry.new
    cheese = Ingredient.new("Cheese", "C", 50)
    mac = Ingredient.new("Macaroni", "oz", 200)
    mac_and_cheese = Recipe.new("Mac and Cheese")
    mac_and_cheese.add_ingredient(cheese, 2)
    mac_and_cheese.add_ingredient(mac, 8)
    pantry.restock(cheese, 5)
    pantry.restock(cheese, 10)
    assert_equal 15, pantry.stock_check(cheese)
  end

  def test_we_can_see_if_we_have_enough_to_make_recipe
    pantry = Pantry.new
    cheese = Ingredient.new("Cheese", "C", 50)
    mac = Ingredient.new("Macaroni", "oz", 200)
    mac_and_cheese = Recipe.new("Mac and Cheese")
    mac_and_cheese.add_ingredient(cheese, 2)
    mac_and_cheese.add_ingredient(mac, 8)
    pantry.restock(cheese, 5)
    pantry.restock(cheese, 10)

    refute pantry.enough_ingredients_for?(mac_and_cheese)
    pantry.restock(mac, 8)
    assert pantry.enough_ingredients_for?(mac_and_cheese)
  end


end
