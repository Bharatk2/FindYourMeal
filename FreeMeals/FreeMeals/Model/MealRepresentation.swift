//
//  Meal.swift
//  FreeMeals
//
//  Created by Bharat Kumar on 8/16/21.
//

import Foundation

class MealRepresentation: Codable {
    var meals: [MealRep]
    
    enum CodingKeys: String, CodingKey {
        case meals = "meals"
    }
    class MealRep: Codable {
        let mealName: String?
        let mealThumb: String?
        let id: String?
        
        enum MealKeys: String, CodingKey {
            case mealName = "strMeal"
            case mealThumb = "strMealThumb"
            case id = "idMeal"
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: MealKeys.self)
            mealName = try container.decodeIfPresent(String.self, forKey: .mealName)
            mealThumb = try container.decodeIfPresent(String.self, forKey: .mealThumb)
            id = try container.decodeIfPresent(String.self, forKey: .id)
            
        }
    }
}

class MealDetailRepresentation: Codable {
    var meals: [MealDetail]
    
    enum CodingKeys: String, CodingKey {
        case meals
    }
    
    class MealDetail: Codable {
        let id: String
        let mealName: String
        let instructions: String
        let ingredients: String
        let measure: String
        let category: String
        
        enum IngredientsKeys: String, CodingKey {
            case id = "idMeal"
            case mealName = "strMeal"
            case instructions = "strInstructions"
            case category = "strCategory"
            case ingredient1 = "strIngredient1"
            case ingredient2 = "strIngredient2"
            case ingredient3 = "strIngredient3"
            case ingredient4 = "strIngredient4"
            case ingredient5 = "strIngredient5"
            case ingredient6 = "strIngredient6"
            case ingredient7 = "strIngredient7"
            case ingredient8 = "strIngredient8"
            case ingredient9 = "strIngredient9"
            case ingredient10 = "strIngredient10"
            case measure1 = "strMeasure1"
            case measure2 = "strMeasure2"
            case measure3 = "strMeasure3"
            case measure4 = "strMeasure4"
            case measure5 = "strMeasure5"
            case measure6 = "strMeasure6"
            case measure7 = "strMeasure7"
            case measure8 = "strMeasure8"
            case measure9 = "strMeasure9"
            case measure10 = "strMeasure10"
        }
        
  
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: IngredientsKeys.self)
            id = try container.decode(String.self, forKey: .id)
            mealName = try container.decode(String.self, forKey: .mealName)
            instructions = try container.decode(String.self, forKey: .instructions)
            
            
        }
    }
}
