# Pantry

## Instructions

* Fork this Repository
* Clone your forked repo to your computer.
* Complete the activity below.
* Push your solution to your forked repo
* Submit a pull request from your repository to this repository
  * Put your name in your PR!

  ## Iteration 1

  Use TDD to build an `Ingredient` class with the following attributes:

  * `name` - the name of the ingredient
  * `unit` - the unit in which the ingredient is measured
  * `calories` - the amount of calories per unit of the ingredient.

  The `Ingredient` class should respond to the following interaction pattern:

  ```ruby
  pry(main)> require './lib/ingredient'
  # => true

  pry(main)> ingredient = Ingredient.new("Cheese", "oz", 50)
  # => #<Ingredient:0x007fe6041273d8...>

  pry(main)> ingredient.name
  # => "Cheese"

  pry(main)> ingredient.unit
  # => "oz"

  pry(main)> ingredient.calories
  # => 50
  ```

  ## Iteration 2

  Use TDD to build a `Recipe` class that responds to the following interaction pattern.

  For the `add_ingredient` method, the first argument is an Ingredient, and the second argument is the amount of the ingredient required for the Recipe.

  The `total_calories` method should sum the calories of each ingredient. The calories for each ingredient can be calculated by multiplying the `calories` attribute of the Ingredient by the amount of the ingredient required for the recipe.

  ```ruby
  pry(main)> require './lib/ingredient'
  # => true

  pry(main)> require './lib/recipe'
  # => true

  pry(main)> ingredient1 = Ingredient.new("Cheese", "C", 100)
  # => #<Ingredient:0x007fe8438c7a70...>

  pry(main)> ingredient2 = Ingredient.new("Macaroni", "oz", 30)
  # => #<Ingredient:0x007fe843857f40...>

  pry(main)> recipe = Recipe.new("Mac and Cheese")
  # => #<Recipe:0x007fe84383d000...>

  pry(main)> recipe.name
  # => "Mac and Cheese"

  pry(main)> recipe.ingredients_required
  # => {}

  pry(main)> recipe.add_ingredient(ingredient1, 2)

  pry(main)> recipe.add_ingredient(ingredient2, 8)

  pry(main)> recipe.ingredients_required
  # => {#<Ingredient:0x00007fd7811553c8...> => 2, #<Ingredient:0x00007fd78110b0e8...> => 8}

  pry(main)> recipe.amount_required(ingredient1)
  # => 2

  pry(main)> recipe.amount_required(ingredient2)       
  # => 8

  pry(main)> recipe.ingredients
  # => [#<Ingredient:0x007fe8438c7a70...>, #<Ingredient:0x007fe843857f40...>]

  pry(main)> recipe.total_calories
  # => 440
  ```

  ## Iteration 3

  Use TDD to build a `Pantry` class that responds to the following interaction pattern:

  ```ruby
  pry(main)> require './lib/pantry'
  # => true

  pry(main)> require './lib/ingredient'
  # => true

  pry(main)> require './lib/recipe'
  # => true

  pry(main)> pantry = Pantry.new
  # => #<Pantry:0x007fd8858863b8...>

  pry(main)> ingredient1 = Ingredient.new("Cheese", "C", 50)
  # => #<Ingredient:0x007fd885846e20...>

  pry(main)> ingredient2 = Ingredient.new("Macaroni", "oz", 200)
  # => #<Ingredient:0x007fd88582ed98...>

  pry(main)> recipe = Recipe.new("Mac and Cheese")
  # => #<Recipe:0x007fd885050fe0...>

  pry(main)> recipe.add_ingredient(ingredient1, 2)

  pry(main)> recipe.add_ingredient(ingredient2, 8)

  pry(main)> pantry.stock
  # => {}

  pry(main)> pantry.stock_check(ingredient1)
  # => 0

  pry(main)> pantry.restock(ingredient1, 5)

  pry(main)> pantry.restock(ingredient1, 10)

  pry(main)> pantry.stock_check(ingredient1)
  # => 15

  pry(main)> pantry.enough_ingredients_for?(recipe)
  # => false

  pry(main)> pantry.restock(ingredient2, 7)

  pry(main)> pantry.enough_ingredients_for?(recipe)
  # => false

  pry(main)> pantry.restock(ingredient2, 1)

  pry(main)> pantry.enough_ingredients_for?(recipe)
  # => true
  ```

  ## Iteration 4

  Use TDD to build a `CookBook` class that responds to the following interaction pattern.

  For the `summary`, ingredients are listed in order of calories. This is the amount of calories that ingredient contributes to the total calories of the recipe, not the amount of calories per single unit of the ingredient.

  ```ruby
  pry(main)> require './lib/cook_book'
  # => true

  pry(main)> require './lib/ingredient'
  # => true

  pry(main)> require './lib/recipe'
  # => true

  pry(main)> cookbook = CookBook.new
  # => #<CookBook:0x00007faae6a42228 @recipes=[]>

  pry(main)> ingredient1 = Ingredient.new("Cheese", "C", 100)
  # => #<Ingredient:0x00007faae6a207e0...>

  pry(main)> ingredient2 = Ingredient.new("Macaroni", "oz", 30)
  # => #<Ingredient:0x00007faae69e3cf0...>

  pry(main)> recipe1 = Recipe.new("Mac and Cheese")
  # => #<Recipe:0x00007faae69c9698...>

  pry(main)> recipe1.add_ingredient(ingredient1, 2)

  pry(main)> recipe1.add_ingredient(ingredient2, 8)

  pry(main)> ingredient3 = Ingredient.new("Ground Beef", "oz", 100)
  # => #<Ingredient:0x00007faae6950860...>

  pry(main)> ingredient4 = Ingredient.new("Bun", "g", 1)
  # => #<Ingredient:0x00007faae694bb80...>

  pry(main)> recipe2 = Recipe.new("Burger")
  # => #<Recipe:0x00007faae692a110...>

  pry(main)> recipe2.add_ingredient(ingredient3, 4)

  pry(main)> recipe2.add_ingredient(ingredient4, 100)

  pry(main)> cookbook.add_recipe(recipe1)

  pry(main)> cookbook.add_recipe(recipe2)

  pry(main)> cookbook.summary
  # => [{:name=>"Mac and Cheese", :details=>{:ingredients=>[{:ingredient=>"Macaroni", :amount=>"8 oz"}, {:ingredient=>"Cheese", :amount=>"2 C"}], :total_calories=>440}}, {:name=>"Burger", :details=>{:ingredients=>[{:ingredient=>"Ground Beef", :amount=>"4 oz"}, {:ingredient=>"Bun", :amount=>"100 g"}], :total_calories=>500}}]
  ```
