require 'pry'
require_relative '../lib/ingredient.rb'
require_relative '../lib/recipe.rb'
require_relative '../lib/pantry.rb'
require 'minitest/autorun'
require 'minitest/pride'

class PantryTest < Minitest::Test

	def setup 
		@pantry = Pantry.new
		@ingredient1 = Ingredient.new("Cheese", "C", 50)
		@ingredient2 = Ingredient.new("Macaroni", "oz", 200)
		@recipe = Recipe.new("Mac and Cheese")
		@recipe.add_ingredient(@ingredient1, 2)
		@recipe.add_ingredient(@ingredient2, 8)
	end

	def test_its_variables
		assert_equal({}, @pantry.stock)
	end

end
