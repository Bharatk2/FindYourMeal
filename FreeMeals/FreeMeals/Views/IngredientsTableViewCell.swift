//
//  IngredientsTableViewCell.swift
//  FreeMeals
//
//  Created by Bharat Kumar on 8/27/21.
//

import UIKit

class IngredientsTableViewCell: UITableViewCell {
    
    var ingredientslabel = UILabel()
    var measureLabel = UILabel()
    var ingredient: MealIngredients? {
        didSet {
            updateViews()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
       handleConstraints()
    }
   
    func handleConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        
        ingredientslabel.font = UIFont(name: "AvenirNext-Regular", size: 11)
        ingredientslabel.textColor = UIColor(named: "#4A4A4A")
        ingredientslabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(ingredientslabel)
        
        // categoryNameLabel label Constraints
        ingredientslabel.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 5).isActive = true
        ingredientslabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2).isActive = true
        ingredientslabel.trailingAnchor.constraint(equalTo: measureLabel.trailingAnchor, constant: -20).isActive = true
        
        // mealNameLabel name setup
        measureLabel.font = UIFont(name: "AvenirNext-Regular", size: 11)
        measureLabel.textColor = UIColor(named: "#4A4A4A")
        addSubview(measureLabel)
        
        // mealNameLabel name constraints
        measureLabel.translatesAutoresizingMaskIntoConstraints = false
        measureLabel.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 5).isActive = true
        measureLabel.leadingAnchor.constraint(equalTo: ingredientslabel.trailingAnchor, constant: 20).isActive = true
        measureLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2).isActive = true
        
    }
    
    func updateViews() {
        guard let ingredient = ingredient else { return }
        ingredientslabel.text = ingredient.name
        measureLabel.text = ingredient.quantity
    }
}
