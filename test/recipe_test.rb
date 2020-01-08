require 'pry'
require_relative '../lib/ingredient.rb'
require_relative '../lib/recipe.rb'
require 'minitest/autorun'
require 'minitest/pride'

class IngredientTest < Minitest::Test

	def setup
		@ingredient1 = Ingredient.new("Cheese", "C", 100)
		@ingredient2 = Ingredient.new("Macaroni", "oz", 30)
		@recipe = Recipe.new("Mac and Cheese")
	end

	def test_its_variables
		assert_equal "Mac and Cheese", @recipe.name
		assert_equal({}, @recipe.ingredients_required)
	end

	def test_add_ingredient
		@recipe.add_ingredient(@ingredient1, 2)
		@recipe.add_ingredient(@ingredient2, 8)
		assert_includes  @recipe.ingredients_required.keys, @ingredient1
	end

	def test_amount_required
		@recipe.add_ingredient(@ingredient1, 2)
		@recipe.add_ingredient(@ingredient2, 8)
		assert_equal 2, @recipe.amount_required(@ingredient1)
		assert_equal 8, @recipe.amount_required(@ingredient2)
	end

	def test_ingredients
		@recipe.add_ingredient(@ingredient1, 2)
		@recipe.add_ingredient(@ingredient2, 8)
		assert_includes @recipe.ingredients, @ingredient2
	end

	def test_total_calores
		@recipe.add_ingredient(@ingredient1, 2)
		@recipe.add_ingredient(@ingredient2, 8)
		assert_equal 440, @recipe.total_calories
	end
		
end
