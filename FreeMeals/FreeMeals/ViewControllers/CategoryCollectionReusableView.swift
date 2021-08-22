//
//  CategoryCollectionReusableView.swift
//  FreeMeals
//
//  Created by Bharat Kumar on 8/21/21.
//

import UIKit

class CategoryCollectionReusableView: UICollectionReusableView {
    static let identifier = "CategoryCollectionReusableView"
    let titleLabel = UILabel()
    let infoButton = UIButton()
    override init(frame: CGRect) {
           super.init(frame: frame)
           self.myCustomInit()
       }

       required init(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)!
           self.myCustomInit()
       }

       func myCustomInit() {
           print("hello there from SupView")
       }
    
}
extension CategoryCollectionReusableView {
    func configure() {
            
            // Add a stack view to section container
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.distribution = .fill
            addSubview(stackView)
            stackView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                stackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
                stackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
                stackView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
                stackView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            ])

            // Setup label and add to stack view
            titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
            stackView.addArrangedSubview(titleLabel)

            
        }
}
