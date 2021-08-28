#  Steps for MVC Implementation.

## Model Implementation

    1. Integrated Core Data & created model representation to sync
        - Category Model -> Category: String, CategoryThumbNail: String
        - Meal Model -> mealName: String, mealId: String, Area: String,MealThumbNail: String 
        - Meal Detail Model -> mealID: String, mealName: String, Insructions: String, Ingredients: [Ingredients]
        - Ingredients Model -> ingredientName: String, measureQuantity: String
    
## Model View Controller (MVC)

    1. Fetched all the Categories
[Category Endpoint](www.themealdb.com/api/json/v1/1/categories.php)
    
    2. Fetched meals by category.
[Meals Endpoint](https://www.themealdb.com/api/json/v1/1/filter.php?c=CATEGORY)

    3. Fetched meal details by meal id.
[Meal Detail Endpoint](https://www.themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID)    
    
## View Controllers

    1. Created CollectionViewController for categories and meals (Storyboard)
        - added PickerViewController to select categories to fetch meals
    2. Create DetailViewController for meal details (Programmatically)
        - Added meal image, instructions
    3. Created TableViewController for meal ingredients (Programmatically)
        - Added ingredients and measures 
    


 
 

