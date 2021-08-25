//
//  MealDetailViewController.swift
//  FreeMeals
//
//  Created by Bharat Kumar on 8/23/21.
//

import UIKit

class MealDetailViewController: UIViewController {

    //MARK: - Properties
    var mealDetail: MealDetailRepresentation?
    var mealImageView = UIImageView()
    var mealNameLabel = UILabel()
    var instructionsLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpSubviews()
    
        // Do any additional setup after loading the view.
    }
    
    
    //MARK: - Methods
    private func setUpSubviews() {
        // Offer Image Setup
        mealImageView.contentMode = .scaleToFill
        mealImageView.translatesAutoresizingMaskIntoConstraints = false
        mealImageView.backgroundColor = .gray
        mealImageView.layer.cornerRadius = 5
        view.addSubview(mealImageView)
        // Offer Image Constraints
        mealImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        mealImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        mealImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        mealImageView.heightAnchor.constraint(equalTo: mealImageView.widthAnchor, constant: 1.0).isActive = true
        
        // Product Name Set up
        mealNameLabel.font = UIFont(name: "AvenirNext-DemiBold", size: 14)
        mealNameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mealNameLabel)
        
        //Product name Constraints
        mealNameLabel.topAnchor.constraint(equalTo: mealImageView.bottomAnchor, constant: 20).isActive = true
        mealNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        mealNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        
        // Product Description Setup
        instructionsLabel.font = UIFont(name: "AvenirNext-DemiBold", size: 12)
        instructionsLabel.lineBreakMode = .byWordWrapping
        instructionsLabel.numberOfLines = 0
        instructionsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(instructionsLabel)
        
        // Product Descriptin Constraints
        instructionsLabel.topAnchor.constraint(equalTo: instructionsLabel.bottomAnchor, constant: 10).isActive = true
        instructionsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        instructionsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        
    }
    
//    private func updateViews() {
//        guard let mealDetail = mealDetail else { return }
//        self.mealNameLabel.text = mealDetail.mealName
//        self.instructionsLabel.text = mealDetail.instructions
//        ModelController.shared.getImages(imageURL: mealDetail.mealThumb) { image, _ in
//            DispatchQueue.main.async {
//                self.mealImageView.image = image
//            }
//        }
//    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
