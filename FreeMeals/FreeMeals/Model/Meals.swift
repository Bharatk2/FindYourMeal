//
//  Meal.swift
//  FreeMeals
//
//  Created by Bharat Kumar on 8/16/21.
//

import Foundation

class Meals: Codable {
    var meals: [Meal]
    
    enum CodingKeys: String, CodingKey {
        case meals = "meals"
    }
    class Meal: Codable {
        let mealName: String?
        let mealThumb: String?
        let id: String
        
        enum MealKeys: String, CodingKey {
            case mealName = "strMeal"
            case mealThumb = "strMealThumb"
            case id = "idMeal"
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: MealKeys.self)
            mealName = try container.decodeIfPresent(String.self, forKey: .mealName)
            mealThumb = try container.decodeIfPresent(String.self, forKey: .mealThumb)
            id = try container.decode(String.self, forKey: .id)
            
        }
    }
}


struct MealDetail: Codable {
    let id: String
    let mealName: String
    let category: String
    let instructions: String
    let mealThumb: String
    let ingredients: [MealIngredients]

}

struct MealIngredients: Codable {
    let name: String
    let quantity: String
}

    

