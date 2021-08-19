//
//  Meal+Convenience.swift
//  FreeMeals
//
//  Created by Bharat Kumar on 8/16/21.
//

import Foundation
import CoreData

extension Meal {
    @discardableResult convenience init(id: String,
                                        mealName: String,
                                        category: String,
                                        area: String,
                                        instructions: String,
                                        mealThumb: String,
                                        context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init(context: context)
        self.id = id
        self.mealName = mealName
        self.category = category
        self.area = area
        self.instructions = instructions
        self.mealThumb = mealThumb
 
    }

    @discardableResult convenience init?(representation: MealRepresentation.MealRep,
                                            context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init(id: representation.id,
                  mealName: representation.mealName,
                  category: representation.category,
                  area: representation.area,
                  instructions: representation.instructions,
                  mealThumb: representation.mealThumb)
    }
}

