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
        let ingredient1: String
        let ingredient2: String
        let ingredient3: String
        let ingredient4: String
        let ingredient5: String
        let ingredient6: String
        let ingredient7: String
        let ingredient8: String
        let ingredient9: String
        let ingredient10: String
        
        let measure1: String
        let measure2: String
        let measure3: String
        let measure4: String
        let measure5: String
        let measure6: String
        let measure7: String
        let measure8: String
        let measure9: String
        let measure10: String
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
            category = try container.decode(String.self, forKey: .category)
            if let ingredient1 = try container.decodeIfPresent(String.self, forKey: .ingredient1) {
                self.ingredient1 = ingredient1
            } else  {
                self.ingredient1 = "N/A"
            }
            if let ingredient2 = try container.decodeIfPresent(String.self, forKey: .ingredient2) {
                self.ingredient2 = ingredient2
            } else {
                self.ingredient2 = "N/A"
            }
            if let ingredient3 = try container.decodeIfPresent(String.self, forKey: .ingredient3) {
                self.ingredient3 = ingredient3
            } else {
                self.ingredient3 = "N/A"
            }
            if let ingredient4 = try container.decodeIfPresent(String.self, forKey: .ingredient4) {
                self.ingredient4 = ingredient4
            } else {
                self.ingredient4 = "N/A"
            }
            if let ingredient5 = try container.decodeIfPresent(String.self, forKey: .ingredient5) {
                self.ingredient5 = ingredient5
            } else {
                self.ingredient5 = "N/A"
            }
            if let ingredient6 = try container.decodeIfPresent(String.self, forKey: .ingredient6) {
                self.ingredient6 = ingredient6
            } else {
                self.ingredient6 = "N/A"
            }
            if let ingredient7 = try container.decodeIfPresent(String.self, forKey: .ingredient7) {
                self.ingredient7 = ingredient7
            } else {
                self.ingredient7 = "N/A"
            }
            if let ingredient8 = try container.decodeIfPresent(String.self, forKey: .ingredient8) {
                self.ingredient8 = ingredient8
            } else {
                self.ingredient8 = "N/A"
            }
            if let ingredient9 = try container.decodeIfPresent(String.self, forKey: .ingredient9) {
                self.ingredient9 = ingredient9
            } else {
                self.ingredient9 = "N/A"
            }
            if let ingredient10 = try container.decodeIfPresent(String.self, forKey: .ingredient10) {
                self.ingredient10 = ingredient10
            } else {
                self.ingredient10 = "N/A"
            }
            
            if let  measure1 = try container.decodeIfPresent(String.self, forKey: .measure1) {
                self.measure1 = measure1
            } else {
                self.measure1 = "N/A"
            }
            if let  measure2 = try container.decodeIfPresent(String.self, forKey: .measure2) {
                self.measure2 = measure2
            } else {
                self.measure2 = "N/A"
            }
            if let  measure3 = try container.decodeIfPresent(String.self, forKey: .measure3) {
                self.measure3 = measure3
            } else {
                self.measure3 = "N/A"
            }
            if let  measure4 = try container.decodeIfPresent(String.self, forKey: .measure4) {
                self.measure4 = measure4
            } else {
                self.measure4 = "N/A"
            }
            if let  measure5 = try container.decodeIfPresent(String.self, forKey: .measure5) {
                self.measure5 = measure5
            } else {
                self.measure5 = "N/A"
            }
            if let  measure6 = try container.decodeIfPresent(String.self, forKey: .measure6) {
                self.measure6 = measure6
            } else {
                self.measure6 = "N/A"
            }
            if let  measure7 = try container.decodeIfPresent(String.self, forKey: .measure7) {
                self.measure7 = measure7
            } else {
                self.measure7 = "N/A"
            }
            if let  measure8 = try container.decodeIfPresent(String.self, forKey: .measure8) {
                self.measure8 = measure8
            } else {
                self.measure8 = "N/A"
            }
            if let  measure9 = try container.decodeIfPresent(String.self, forKey: .measure9) {
                self.measure9 = measure9
            } else {
                self.measure9 = "N/A"
            }
            if let  measure10 = try container.decodeIfPresent(String.self, forKey: .measure10) {
                self.measure10 = measure10
            } else {
                self.measure10 = "N/A"
            }
        }
    }
}
