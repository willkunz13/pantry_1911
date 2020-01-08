require 'pry;'
require_relative './lib/ingredient.rb'
require 'minitest/autorun'
require 'minitest/pride'

class IngredientTest < Minitest::Test

	def setup
		@ingredient = Ingredient.new("Cheese", "oz", 50)
	end

	
