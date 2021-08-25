//
//  MealCollectionViewCell.swift
//  FreeMeals
//
//  Created by Bharat Kumar on 8/20/21.
//

import UIKit

class MealCollectionViewCell: UICollectionViewCell {
    var categoryNameLabel = UILabel()
    var mealNameLabel = UILabel()
    var productImage = UIImageView()
    //MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        handleConstraints()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        handleConstraints()
    }
    
    override func prepareForReuse() {
        self.categoryNameLabel.text = ""
        self.mealNameLabel.text = ""
        self.productImage.image = nil
    }
    func handleConstraints() {
        //Content View Constraints
        
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        
        // Background Setup
        let backgroundView = UIView()
        backgroundView.backgroundColor = .systemGroupedBackground
        backgroundView.layer.cornerRadius = 5
        backgroundView.contentMode = .left
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(backgroundView)

        //Background Constraints
        backgroundView.topAnchor.constraint(equalTo: topAnchor, constant: 4).isActive = true
        backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2).isActive = true
        backgroundView.widthAnchor.constraint(equalTo: backgroundView.heightAnchor, multiplier: 1).isActive = true
        
        
        // categoryNameLabel label Setup
        categoryNameLabel.font = UIFont(name: "AvenirNext-DemiBold", size: 12)
        categoryNameLabel.textColor = UIColor(named: "#4A4A4A")
        categoryNameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(categoryNameLabel)
        
        // categoryNameLabel label Constraints
        categoryNameLabel.topAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: 10).isActive = true
        categoryNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2).isActive = true
        categoryNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2).isActive = true
        
        // mealNameLabel name setup
        mealNameLabel.font = UIFont(name: "AvenirNext-Regular", size: 11)
        mealNameLabel.textColor = UIColor(named: "#4A4A4A")
        addSubview(mealNameLabel)
        
        // mealNameLabel name constraints
        mealNameLabel.translatesAutoresizingMaskIntoConstraints = false
        mealNameLabel.topAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: 30).isActive = true
        mealNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2).isActive = true
        mealNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2).isActive = true
        
        //Product Image Setup
        productImage.translatesAutoresizingMaskIntoConstraints = false
        productImage.contentMode = .scaleAspectFit
        addSubview(productImage)
        
        //Product Image Constraints
        productImage.widthAnchor.constraint(equalTo: backgroundView.heightAnchor, multiplier: 1).isActive = true
        productImage.topAnchor.constraint(equalTo: backgroundView.topAnchor).isActive = true
        productImage.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor).isActive = true
        productImage.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 5).isActive = true
        productImage.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -5).isActive = true
    }
    
    
}
