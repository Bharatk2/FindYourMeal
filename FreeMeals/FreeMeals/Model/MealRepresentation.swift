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

struct MealDetailRepresentation: Codable {
    var meals: [MealDetail]
    

    enum CodingKeys: String, CodingKey {
        case meals
    }
}
struct MealDetail: Codable {
    let id: String
    let mealName: String
    let category: String
    let instructions: String
    let mealThumb: String
    let ingredients: String

}
struct MealIngredients: Codable {
    let name: String
    let quantity: String
}

    

