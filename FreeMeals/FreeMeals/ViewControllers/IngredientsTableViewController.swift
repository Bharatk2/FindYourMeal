//
//  IngredientsTableViewController.swift
//  FreeMeals
//
//  Created by Bharat Kumar on 8/27/21.
//

import UIKit

class IngredientsTableViewController: UITableViewController {
    var ingredientsCellIdentifier = "ingredientsCell"
    var ingredients: [MealIngredients] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        registerIngredientsTableViewCell()
    }
    
    func setUpTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        view.backgroundColor = .lightGray
        tableView.backgroundColor = .lightGray
    }
    func registerIngredientsTableViewCell() {
        self.tableView.register(IngredientsTableViewCell.self, forCellReuseIdentifier: ingredientsCellIdentifier)
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ingredients.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ingredientsCellIdentifier, for: indexPath) as? IngredientsTableViewCell else {
            return UITableViewCell()
        }
        
        cell.ingredient = ingredients[indexPath.row]

        return cell
    }
    

    

}
