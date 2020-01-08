class CookBook
	
	attr_reader :summary

	def initialize
		@summary = []
	end

	def add_recipe(recipe)
		binding.pry
		summary << recipe
	end
end
		
		
