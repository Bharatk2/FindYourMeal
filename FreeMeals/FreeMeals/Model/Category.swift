//
//  Category.swift
//  FreeMeals
//
//  Created by Bharat Kumar on 8/16/21.
//

import Foundation

class Categories: Codable {
    var categories: [CategoryRepresentation]
    
    enum CodingKeys: String, CodingKey {
        case categories
    }
    
    class CategoryRepresentation: Codable {
        var id: String
        var category: String
        var categoryThumb: String
        
        enum CategoryKeys: String, CodingKey {
            case id = "idCategory"
            case category = "strCategory"
            case categoryThumb = "strCategoryThumb"
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: Categories.CodingKeys.self)
            var categoriesContainer = try container.nestedUnkeyedContainer(forKey: .categories)
            let categoryDictionary = try categoriesContainer.nestedContainer(keyedBy: CategoryKeys.self)
            id = try categoryDictionary.decode(String.self, forKey: .id)
            category = try categoryDictionary.decode(String.self, forKey: .category)
            categoryThumb = try categoryDictionary.decode(String.self, forKey: .categoryThumb)
            
        }
    }
}
