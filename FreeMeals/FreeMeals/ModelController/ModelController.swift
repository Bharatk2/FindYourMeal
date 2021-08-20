//
//  ModelController.swift
//  FreeMeals
//
//  Created by Bharat Kumar on 8/16/21.
//

import Foundation
import CoreData
import UIKit

enum NetworkError: Error {
    case noData(String), badData(String)
    case failedFetch(String), badURL(String)
    case badError(String)
}

class ModelController {
    
    // MARK: - Properties
    var categories: [Categories.CategoryRepresentation] = []
    var categoryName: String?
    var meals: [MealRepresentation.MealRep] = []
    var imageCache = Cache<NSString, AnyObject>()
    var dataLoader: DataLoader?
    let operationQueue = OperationQueue()
    static var shared = ModelController()
    
    // MARK: - Computed Properties
    private lazy var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
    
    // MARK: - Initializer
    init(dataLoader: DataLoader = URLSession.shared) {
        self.dataLoader = dataLoader
    }
    
    func getCategories(completion: @escaping (Categories?, Error?) -> Void) {
        
        var request = URLRequest(url: Endpoints.categories)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = HTTPMethod.get.rawValue
        
        dataLoader?.loadData(from: request, completion: { data, response, error in
            
            if let response = response as? HTTPURLResponse {
                NSLog("Server responded with: \(response.statusCode)")
            }
            
            if let error = error {
                completion(nil, error)
            }
            
            guard let data = data else {
                completion(nil, NetworkError.badData("No data was returned"))
                return
            }
            
            let categories = Categories.self
            
            do {
                let categories = try self.decoder.decode(categories, from: data)
                

                self.categories = categories.categories
                
                return completion(categories, nil)
            } catch {
                return completion(nil, NetworkError.badData("there was an error decoding data"))
            }
        })
    }
    
    func getMeals(category: String,completion: @escaping (MealRepresentation?, Error?) -> Void) {
     
        let requestURL = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(category)")!
        var request = URLRequest(url: requestURL)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = HTTPMethod.get.rawValue
        dataLoader?.loadData(from: request, completion: { data, response, error in
            if let response = response as? HTTPURLResponse {
                NSLog("Server responded with: \(response.statusCode)")
            }
            
            if let error = error {
                completion(nil, error)
            }
            
            guard let data = data else {
                completion(nil, NetworkError.badData("No data was returned for meals"))
                return
            }
            
            let meals = MealRepresentation.self
            
            do {
                let meals = try self.decoder.decode(meals, from: data)
                
                self.meals = meals.meals
                return completion(meals, nil)
            } catch {
                return completion(nil, NetworkError.badData("there was an error decodig meal data "))
            }
            
        })
        
    }
    
    
}
