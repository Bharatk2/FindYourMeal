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
        case meals
    }
    
    class MealRep: Codable {
        let id: String
        let mealName: String
        let category: String
        let area: String
        let instructions: String
        let mealThumb: String
        
        
        
        enum MealKeys: String, CodingKey {
            case id = "idMeal"
            case mealName = "strMeal"
            case category = "strCategory"
            case area = "strArea"
            case instructions = "strInstructions"
            case mealThumb = "strMealThumb"
        }
        
        
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: MealRepresentation.CodingKeys.self)
            var mealContainer = try container.nestedUnkeyedContainer(forKey: .meals)
            let mealDictionary = try mealContainer.nestedContainer(keyedBy: MealKeys.self)
            id = try mealDictionary.decode(String.self, forKey: .id)
            mealName = try mealDictionary.decode(String.self, forKey: .mealName)
            category = try mealDictionary.decode(String.self, forKey: .category)
            area = try mealDictionary.decode(String.self, forKey: .area)
            instructions = try mealDictionary.decode(String.self, forKey: .instructions)
            mealThumb = try mealDictionary.decode(String.self, forKey: .mealThumb)
            
        }
    }
}
