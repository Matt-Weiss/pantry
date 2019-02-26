require './test/test_helper'

class CookBookTest < Minitest::Test

  def test_it_exists
    cookbook = CookBook.new
    assert_instance_of CookBook, cookbook
  end

  def test_recipes_begins_as_empty_array
    cookbook = CookBook.new
    assert_equal [], cookbook.recipes
  end

  def test_we_can_add_recipes_to_cookbook
    cookbook = CookBook.new
    cheese = Ingredient.new("Cheese", "C", 100)
    mac = Ingredient.new("Macaroni", "oz", 30)
    mac_and_cheese = Recipe.new("Mac and Cheese")
    mac_and_cheese.add_ingredient(cheese, 2)
    mac_and_cheese.add_ingredient(mac, 8)
    cookbook.add_recipe(mac_and_cheese)
    assert_equal [mac_and_cheese], cookbook.recipes
  end

  def test_we_can_get_summary_of_recipes
    cookbook = CookBook.new
    cheese = Ingredient.new("Cheese", "C", 100)
    mac = Ingredient.new("Macaroni", "oz", 30)
    mac_and_cheese = Recipe.new("Mac and Cheese")
    mac_and_cheese.add_ingredient(cheese, 2)
    mac_and_cheese.add_ingredient(mac, 8)
    cookbook.add_recipe(mac_and_cheese)
    ground_beef = Ingredient.new("Ground Beef", "oz", 100)
    bun = Ingredient.new("Bun", "g", 1)
    burger = Recipe.new("Burger")
    burger.add_ingredient(ground_beef, 4)
    burger.add_ingredient(bun, 100)
    cookbook.add_recipe(burger)
    expected = [{:name=>"Mac and Cheese",
                  :details=>{
                    :ingredients=>[{:ingredient=>"Macaroni", :amount=>"8 oz"},
                                   {:ingredient=>"Cheese", :amount=>"2 C"}],
                    :total_calories=>440}},
                {:name=>"Burger",
                  :details=>{
                    :ingredients=>[{:ingredient=>"Ground Beef", :amount=>"4 oz"},
                                   {:ingredient=>"Bun", :amount=>"100 g"}],
                    :total_calories=>500}}]
    assert_equal expected, cookbook.summary
  end

end
