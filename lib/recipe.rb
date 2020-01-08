class Recipe

	attr_reader :name, :ingredients_required

	def initialize(name)
		@name = name
		@ingredients_required = {}
	end
	
	def add_ingredient(ingredient, number)
		@ingredients_required[ingredient] = number
	end

	def amount_required(ingredient)
		@ingredients_required[ingredient]
	end

	def ingredients
		@ingredients_required.keys
	end

	def total_calories
		ingredients_required.sum {|ingredient, number| ingredient.calories * number}
	end
				


end	
