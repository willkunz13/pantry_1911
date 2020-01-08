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
	

	def test_stock_check_restock
		assert_equal 0, @pantry.stock_check(@ingredient1)
		@pantry.restock(@ingredient1, 5)
		@pantry.restock(@ingredient1, 10)
		assert_equal 15, @pantry.stock_check(@ingredient1)		
	end

	def test_enough_ingredients_for?
		@pantry.restock(@ingredient1, 5)
		@pantry.restock(@ingredient1, 10)
		assert_equal false, @pantry.enough_ingredients_for?(@recipe)
		@pantry.restock(@ingredient2, 7)
		assert_equal false, @pantry.enough_ingredients_for?(@recipe)
		@pantry.restock(@ingredient2, 1)
		binding.pry
		assert_equal true, @pantry.enough_ingredients_for?(@recipe)
	end
	

end

