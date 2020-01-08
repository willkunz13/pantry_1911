require 'pry'
require_relative '../lib/ingredient.rb'
require_relative '../lib/recipe.rb'
require_relative '../lib/cook_book.rb'
require 'minitest/autorun'
require 'minitest/pride'

class CookBookTest < Minitest::Test

	def setup
		@cookbook = CookBook.new
		@ingredient1 = Ingredient.new("Cheese", "C", 100)
		@ingredient2 = Ingredient.new("Macaroni", "oz", 30)
		@recipe1 = Recipe.new("Mac and Cheese")
		@recipe1.add_ingredient(@ingredient1, 2)
		@recipe1.add_ingredient(@ingredient2, 8)
		@ingredient3 = Ingredient.new("Ground Beef", "oz", 100)
		@ingredient4 = Ingredient.new("Bun", "g", 1)
		@recipe2 = Recipe.new("Burger")
		@recipe2.add_ingredient(@ingredient3, 4)
		@recipe2.add_ingredient(@ingredient4, 100)
	end

	def test_summary_add_recipe
		@cookbook.add_recipe(@recipe1)
		@cookbook.add_recipe(@recipe2)
		assert_includes @cookbook.summary, @recipe1
		assert_includes @cookbook.summary, @recipe2
	end
end
