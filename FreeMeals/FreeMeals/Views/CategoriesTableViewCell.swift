//
//  CategoriesTableViewCell.swift
//  FreeMeals
//
//  Created by Bharat Kumar on 8/19/21.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryName: UILabel!
    
    @IBOutlet weak var mealName: UILabel!
    var meal: MealRepresentation.MealRep? {
        didSet {
            mealUpdateViews()
        }
    }
    var category: Categories.CategoryRepresentation? {
        didSet {
            updateViews()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateViews() {
        categoryName.text = category?.category
    }
    func mealUpdateViews() {
        mealName.text = meal?.mealName
    }

}
