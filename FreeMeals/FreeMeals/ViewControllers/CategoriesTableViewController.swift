//
//  CategoriesTableViewController.swift
//  FreeMeals
//
//  Created by Bharat Kumar on 8/19/21.
//

import UIKit

class CategoriesTableViewController: UITableViewController {
    
    var categories: [Categories.CategoryRepresentation] = []
    var meals: [MealRepresentation.MealRep] = []
    var isCategory = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
                self.tableView.reloadData()
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
                self.tableView.reloadData()
            }
        }
        
    }
    
    private func categoryFor(indexPath: IndexPath) -> Categories.CategoryRepresentation? {
        if indexPath.section == 0 {
            return categories[indexPath.row]
        } else {
            return nil
        }
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return categories.count
        } else {
            return meals.count
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as? CategoriesTableViewCell else { return UITableViewCell() }
        if indexPath.section == 0 {
            cell.category = categories[indexPath.row]
        } else  {
     
            cell.meal = meals[indexPath.row]
                
            
        }
        // there is going to be different actions in between that
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
