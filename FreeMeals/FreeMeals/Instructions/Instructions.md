#  Steps for MVC Implementation.

## Model Implementation

    1. Created models
        - Category Model -> Category: String, CategoryThumbNail: String
        - Meal Model -> mealName: String, mealId: String, Area: String,MealThumbNail: String 
        - Meal Detail Model -> mealID: String, mealName: String, Insructions: String, Ingredients: [Ingredients]
        - Ingredients Model -> ingredientName: String, measureQuantity: String
    
## Model View Controller (MVC)

    1. Fetched all the Categories
<img src= "https://i.ibb.co/PTW77WJ/Screen-Shot-2021-08-27-at-5-50-58-PM.png" width="400" >
    
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
    


 
 

