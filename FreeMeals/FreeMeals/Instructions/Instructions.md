#  Steps for MVC Implementation.

## Model Implementation

    1. Integrated Core Data & created model representation to sync
        - Category Model -> Category: String, CategoryThumbNail: String
        - Meal Model -> MealName: String, Category: String, Area: String, Instructions: String, MealThumbNail: String 
    
## Model View Controller (MVC)


    1. Fetch all the Categories
[Category Endpoint](www.themealdb.com/api/json/v1/1/categories.php)
    
    2. Fetch meals by category & detail.
[Meals Endpoint](https://www.themealdb.com/api/json/v1/1/filter.php?c=CATEGORY)
[Meal Detail Endpoint](https://www.themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID)

    3. Fetch category & meal image 
    
## View Controllers

    1. Create TableViewController and add subheadings with meal category names with a category image at the right side.
        - add meals according to it's category heading into the tableview row. 
        - Sort it alphabetically 
        
    2. Create DetailViewController
        -Add meal image, instructions, ingredients/measurements
    


 
 

