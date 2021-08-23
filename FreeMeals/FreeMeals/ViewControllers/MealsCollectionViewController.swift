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
    var correctMeals: [MealRepresentation.MealRep] = []
    var categories: [Categories.CategoryRepresentation] = []
    var meals: [MealRepresentation.MealRep] = []
    var mealDetails: [MealDetailRepresentation.MealDetail] = []
    var horizontalMeals: CGFloat = 2

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        registerCollectionViewCell()
        getCategoriesAndMeals()
        
        collectionView.register(CategoryCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CategoryCollectionReusableView.identifier)
        
        
        
    }
    
    func setUpCollectionView() {
   
        collectionView.accessibilityScroll(.right)
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
            for category in self.categories {
                
               
                fetchMeals(category: category.category)
                
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
            if category == category {
            self.meals = meals.meals
            }

            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
    }
    
    func fetchMealDetails(mealID: String) {
        ModelController.shared.getMealsById(mealID: mealID) { mealDetails, error in
            if let error = error {
                NSLog("error in fetching meal details: \(error)")
                return
            }
        
            guard let mealDetails = mealDetails else {
                NSLog("mealdetail not found")
                return
            }
            self.mealDetails = mealDetails.meals
            
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let horizontalInsets = collectionView.contentInset.left + collectionView.contentInset.right
        let itemSpacing = (collectionViewLayout as! UICollectionViewFlowLayout).minimumInteritemSpacing * (horizontalMeals - 1)
        let width = (collectionView.frame.width - horizontalInsets - itemSpacing) / horizontalMeals
        return CGSize(width: width, height: width * 1.3)
    }


    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return categories.count
       
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
 
            return meals.count
       
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: customCellIdentifier, for: indexPath) as? MealCollectionViewCell else { return UICollectionViewCell() }
       
//        if categories[indexPath.row].category == mealDetails[indexPath.row].category && meals[indexPath.row].mealName == mealDetails[indexPath.row].mealName {
//            correctMeals.append(meals[indexPath.row])
//        }
//
        if indexPath.row < meals.count  {
            cell.mealNameLabel.text = meals[indexPath.row].mealName
            guard let imageURL = meals[indexPath.row].mealThumb else { return cell }
            
            ModelController.shared.getImages(imageURL: imageURL) { image, _ in
                DispatchQueue.main.async {
                    cell.productImage.image = image
                }
            }
        }
        
        // Configure the cell
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CategoryCollectionReusableView.identifier, for: indexPath) as? CategoryCollectionReusableView else { return UICollectionReusableView() }
        header.configure()
        if indexPath.section < categories.count {
           
        header.titleLabel.text = categories[indexPath.section].category
        }
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 50)
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
