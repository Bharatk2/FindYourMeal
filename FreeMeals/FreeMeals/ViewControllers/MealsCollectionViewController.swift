//
//  MealsCollectionViewController.swift
//  FreeMeals
//
//  Created by Bharat Kumar on 8/20/21.
//

import UIKit

private let reuseIdentifier = "Cell"

class MealsCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let customCellIdentifier = "mealCellIdentifier"
    var categories: [Categories.CategoryRepresentation] = []
    var meals: [MealRepresentation.MealRep] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        registerCollectionViewCell()
        getCategoriesAndMeals()
    }
    
    func setUpCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: 150, height: 150)
        layout.scrollDirection = .horizontal
        
        let frame = self.view.frame
        collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        view.backgroundColor = .lightGray
        collectionView.backgroundColor = .lightGray
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func registerCollectionViewCell() {
        collectionView.register(MealCollectionViewCell.self, forCellWithReuseIdentifier: customCellIdentifier)
        navigationItem.title = "Home"
        collectionView.backgroundColor = UIColor.white
    }
    
    func getCategoriesAndMeals() {
        ModelController.shared.getCategories { [self] categories, error in
            if let error = error {
                NSLog("error in fetching categories: \(error)")
                return
            }
            guard let categories = categories else {
                NSLog("Categories not found")
                return
            }
            self.categories = categories.categories
            let categoriesNames = self.categories.map { $0.category }
            for name in categoriesNames {
                fetchMeals(category: name)
            }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
    }
    func fetchMeals(category: String) {
        ModelController.shared.getMeals(category: category) { meals, error in
            if let error = error {
                NSLog("error in fetching meals: \(error)")
                return
            }
            
            guard let meals = meals else {
                NSLog("meals not found")
                return
            }
            self.meals = meals.meals
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        // Configure the cell
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
}
