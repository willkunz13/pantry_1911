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
		assert_equal {}, @recipe.ingredients_required
	end
		
end
