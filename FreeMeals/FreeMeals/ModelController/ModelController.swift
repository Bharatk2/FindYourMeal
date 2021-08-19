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
    var imageCache = Cache<NSString, AnyObject>()
    var mealCache = Cache<String, Meal>()
    var bgContext = CoreDataStack.shared.container.newBackgroundContext()
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
    
}
