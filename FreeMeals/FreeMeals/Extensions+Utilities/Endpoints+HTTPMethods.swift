//
//  Endpoints+HTTPMethods.swift
//  FreeMeals
//
//  Created by Bharat Kumar on 8/18/21.
//

import Foundation

enum Endpoints {
    static let baseURL = "https://www.themealdb.com/api/json/v1/1/"
    case categories
    case meals(String)
    case mealsDetail(String)
    
    var stringValue: String {
        switch self {
        case .categories:
            return Endpoints.baseURL + "categories.php"
        case .meals(let category):
            return Endpoints.baseURL + "filter.php?c=" + "\(category)"
        case .mealsDetail(let mealID):
            return Endpoints.baseURL + "lookup.php?i=" + "\(mealID)"
        }
    }
    
    var url: URL {
        return URL(string: stringValue)!
    }
}

enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
}
