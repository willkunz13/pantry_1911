require 'pry'
require_relative '../lib/ingredient.rb'
require 'minitest/autorun'
require 'minitest/pride'

class IngredientTest < Minitest::Test

	def setup
		@ingredient = Ingredient.new("Cheese", "oz", 50)
	end

	def test_its_variables
		assert_equal "Cheese", @ingredient.name
		assert_equal "oz", @ingredient.unit
		assert_equal 50, @ingredient.calories
	end
end	
