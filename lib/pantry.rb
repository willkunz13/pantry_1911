class Pantry

	attr_reader :stock
	
	def initialize
		@stock = {}
	end
	
	def stock_check(ingredient)
		if stock[ingredient]
			stock[ingredient]
		else
			0
		end
	end

	def restock(ingredient, number)
		if stock[ingredient]
			stock[ingredient] += number
		else
			stock[ingredient] = number
		end
	end

	def enough_ingredients_for?(recipe)
		if (recipe.ingredients_required.keys - stock.keys != [])
			return false
		else
			compared_stock = stock.map {|ingredient, number| number - recipe.ingredients_required[ingredient]}
			binding.pry
			if compared_stock.min < 0
				binding.pry
				return false
			else
				return true
			end
		end
				
	end

end
