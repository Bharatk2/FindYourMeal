//
//  MealsCollectionViewController.swift
//  FreeMeals
//
//  Created by Bharat Kumar on 8/20/21.
//

import UIKit

class MealsViewController: UIViewController {
    
    let customCellIdentifier = "mealCellIdentifier"
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pickerViewController: UIPickerView!
    var categoryIndex: [Categories.CategoryRepresentation: Int] = [:]
    var categoryDictionary: [Categories.CategoryRepresentation: [MealRepresentation.MealRep]] = [:]
    let categoryNames: [String] = []
    var categories: [Categories.CategoryRepresentation] = []
    var meals: [MealRepresentation.MealRep] = []
    
    var horizontalMeals: CGFloat = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        pickerViewController.delegate = self
        pickerViewController.dataSource = self
        registerCollectionViewCell()
        getCategoriesAndMeals()
        collectionView.register(CategoryCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CategoryCollectionReusableView.identifier)
    }
    
    
    private func setUpViews() {
        
    }
    func setUpCollectionView() {
        
        collectionView.accessibilityScroll(.right)
        view.backgroundColor = .lightGray
        collectionView.backgroundColor = .lightGray
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
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
            
            
            DispatchQueue.main.async {
                self.pickerViewController.reloadAllComponents()
                self.collectionView.reloadData()
            }
        }
        
        
        
    }
    
    func testFetchMeals(for indexPath: IndexPath) {
        ModelController.shared.getMeals(category: categories[indexPath.row].category) { meals, error in
            if let error = error {
                NSLog("error in fetching meals: \(error)")
                return
            }
            
            guard let meals = meals else {
                NSLog("meals not found")
                return
            }
            
            
            self.meals = meals.meals
            for meal in self.meals {
                self.fetchMealDetails(mealID: meal.id ?? "")
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
            
            
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
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
// an array of dictionarys with [Category: [Meal]]
// MARK: UICollectionViewDataSource
extension MealsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let horizontalInsets = collectionView.contentInset.left + collectionView.contentInset.right
        let itemSpacing = (collectionViewLayout as! UICollectionViewFlowLayout).minimumInteritemSpacing * (horizontalMeals - 1)
        let width = (collectionView.frame.width - horizontalInsets - itemSpacing) / horizontalMeals
        return CGSize(width: width, height: width * 1.3)
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        
        return self.meals.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: customCellIdentifier, for: indexPath) as? MealCollectionViewCell else { return UICollectionViewCell() }
        
        if indexPath.row < meals.count {
            cell.mealNameLabel.text = meals[indexPath.row].mealName
            guard let imageURL = meals[indexPath.row].mealThumb else { return cell }
            ModelController.shared.getImages(imageURL: imageURL) { image, _ in
                DispatchQueue.main.async {
                    cell.productImage.image = image
                }
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                let mealsDetailViewController = MealDetailViewController()
        
                let collectionMeal = meals[indexPath.row]
                mealsDetailViewController.meal = collectionMeal
                navigationController?.pushViewController(mealsDetailViewController, animated: true)
    }
    
    
}



extension MealsViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row].category
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCat = categories[row].category
        print("selectedCat   \(selectedCat)")
        self.fetchMeals(category: selectedCat)
    }
}
