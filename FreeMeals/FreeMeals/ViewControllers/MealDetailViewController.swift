//
//  MealDetailViewController.swift
//  FreeMeals
//
//  Created by Bharat Kumar on 8/23/21.
//

import UIKit

class MealDetailViewController: UIViewController {
    
    //MARK: - Properties
    var ingredientsButton = UIButton()
    var mealImageView = UIImageView()
    var mealNameLabel = UILabel()
    var instructionTitle = UILabel()
    var instructionsLabel = UILabel()
    var ingredientsLabel = UILabel()
    var meal: MealRepresentation.MealRep?
    var ingredients: [MealIngredients] = []
    var mealDetail: MealDetail?
    
    private lazy var scrollView: UIScrollView = {
      let scrollView = UIScrollView()
      scrollView.backgroundColor = .white
      scrollView.translatesAutoresizingMaskIntoConstraints = false
      return scrollView
    }()

    private lazy var contentView: UIView = {
      let contentView = UIView()
      contentView.backgroundColor = .white
      contentView.translatesAutoresizingMaskIntoConstraints = false
      return contentView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpSubviews()
        guard let meal = meal else { return }
        getMealDetails(meal: meal)
        setupScrollView()
        view.backgroundColor = .white

    }
    
    //MARK: - Methods
    func setupScrollView(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        self.scrollView.contentSize = contentView.frame.size
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor)
        ])
        
        let contentViewCenterY = contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor)
        contentViewCenterY.priority = .defaultLow

        let contentViewHeight = contentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        contentViewHeight.priority = .defaultLow

        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentViewCenterY,
            contentViewHeight
        ])
    }
    
    private func setUpSubviews() {
        // Offer Image Setup
        mealImageView.contentMode = .scaleToFill
        mealImageView.translatesAutoresizingMaskIntoConstraints = false
        mealImageView.backgroundColor = .gray
        mealImageView.layer.cornerRadius = 5
        contentView.addSubview(mealImageView)
        // Offer Image Constraints
        mealImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        mealImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        mealImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        mealImageView.heightAnchor.constraint(equalTo: mealImageView.widthAnchor, constant: 1.0).isActive = true
        
        // Product Name Set up
        mealNameLabel.font = UIFont(name: "AvenirNext-DemiBold", size: 14)
        mealNameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(mealNameLabel)
        
        //Product name Constraints
        mealNameLabel.topAnchor.constraint(equalTo: mealImageView.bottomAnchor, constant: 20).isActive = true
        mealNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50).isActive = true
        mealNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50).isActive = true
        
        // Product Description Setup
        
        
        instructionTitle.font = UIFont(name: "AvenirNext-DemiBold", size: 16)
        instructionTitle.lineBreakMode = .byWordWrapping
        instructionTitle.numberOfLines = 0
        instructionTitle.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(instructionTitle)
        
        // Product title Constraints
        instructionTitle.topAnchor.constraint(equalTo: mealNameLabel.bottomAnchor, constant: 10).isActive = true
        instructionTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50).isActive = true
        instructionTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50).isActive = true
        
        instructionsLabel.font = UIFont(name: "Avenir", size: 12)
        instructionsLabel.lineBreakMode = .byWordWrapping
        instructionsLabel.numberOfLines = 0
        instructionsLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(instructionsLabel)
        
        // Product Descriptin Constraints
        instructionsLabel.topAnchor.constraint(equalTo: instructionTitle.bottomAnchor, constant: 10).isActive = true
        instructionsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50).isActive = true
        instructionsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50).isActive = true
        ingredientsButton.setTitle("View Ingredients", for: .normal)
        ingredientsButton.layer.cornerRadius = 12
        ingredientsButton.layer.borderColor = UIColor.black.cgColor
        ingredientsButton.layer.backgroundColor = UIColor.orange.cgColor
        ingredientsButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(ingredientsButton)
        
        ingredientsButton.topAnchor.constraint(equalTo: instructionsLabel.bottomAnchor, constant: 10).isActive = true
        ingredientsButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50).isActive = true
        ingredientsButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50).isActive = true
        ingredientsButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 5).isActive = true
        ingredientsButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        ingredientsButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        ingredientsButton.addTarget(self, action: #selector(ingredientsViewController), for: .touchUpInside)
    }
    
    @objc func ingredientsViewController() {
        let detailVC = IngredientsTableViewController(nibName: nil, bundle: nil)
            detailVC.ingredients = ingredients
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
    func getMealDetails(meal: MealRepresentation.MealRep) {
        ModelController.shared.getMealsById(mealID: meal.id) { mealDetail, error in
            if let error = error {
                NSLog("There is an error fetching meal details: \(error)")
                return
            }
            guard let mealDetail = mealDetail else { return }
            self.updateViews(mealDetail: mealDetail)
            self.mealDetail = mealDetail
            
            ModelController.shared.getImages(imageURL: mealDetail.mealThumb) { image, _ in
                DispatchQueue.main.async {
                    self.mealImageView.image = image
                }
            }
        }
    }
    
    private func updateViews(mealDetail: MealDetail) {
        self.instructionTitle.text = "Instructions"
        self.mealNameLabel.text = mealDetail.mealName
        self.instructionsLabel.text = mealDetail.instructions
        self.ingredients = mealDetail.ingredients
        
    }
    
}
