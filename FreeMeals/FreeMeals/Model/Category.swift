//
//  Category.swift
//  FreeMeals
//
//  Created by Bharat Kumar on 8/16/21.
//

import Foundation

struct Categories: Codable, Hashable {
    static func == (lhs: Categories, rhs: Categories) -> Bool {
        return lhs.categories == rhs.categories
    }
    
    var categories: [CategoryRepresentation]
    
    enum CodingKeys: String, CodingKey {
        case categories
    }
    
    struct CategoryRepresentation: Codable, Hashable {
        static func == (lhs: Categories.CategoryRepresentation, rhs: Categories.CategoryRepresentation) -> Bool {
            return lhs.category == rhs.category && lhs.categoryThumb == rhs.categoryThumb && lhs.id == rhs.id
        }
        
        
        var id: String
        var category: String
        var categoryThumb: String
       
        
        enum CategoryKeys: String, CodingKey {
            case id = "idCategory"
            case category = "strCategory"
            case categoryThumb = "strCategoryThumb"
        }
        
         init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CategoryKeys.self)
            id = try container.decode(String.self, forKey: .id)
            category = try container.decode(String.self, forKey: .category)
            categoryThumb = try container.decode(String.self, forKey: .categoryThumb)
        }
    }
}
