//
//  Endpoints+HTTPMethods.swift
//  FreeMeals
//
//  Created by Bharat Kumar on 8/18/21.
//

import Foundation

enum Endpoints {}

extension Endpoints {
    static let categories = URL(string: "https://themealdb.com/api/json/v1/1/categories.php")!
    static let meals = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=")!
    static let mealById = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=")!
}

enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
}
