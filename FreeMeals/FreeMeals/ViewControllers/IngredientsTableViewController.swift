//
//  IngredientsTableViewController.swift
//  FreeMeals
//
//  Created by Bharat Kumar on 8/27/21.
//

import UIKit

class IngredientsTableViewController: UITableViewController {
    
    var ingredients: [MealIngredients] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ingredients.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell", for: indexPath)
        

        return cell
    }
    

    

}
