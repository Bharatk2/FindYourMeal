//
//  CategoriesTableViewCell.swift
//  FreeMeals
//
//  Created by Bharat Kumar on 8/19/21.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryName: UILabel!
    
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

}
