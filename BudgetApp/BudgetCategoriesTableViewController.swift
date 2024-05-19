//
//  ViewController.swift
//  BudgetApp
//
//  Created by stamoulis nikolaos on 20/5/24.
//

import UIKit
import CoreData

class BudgetCategoriesTableViewController: UIViewController {

    //MARK: -Properties
    private var persistentContainer: NSPersistentContainer
    
    init(persistentContainer: NSPersistentContainer) {
        self.persistentContainer = persistentContainer
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: -Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @objc func showAddBudgetCategory(_ sender: UIBarButtonItem) {
        let navController = UINavigationController(rootViewController: AddBudgetCategoryViewController(persistentContainer: persistentContainer))
        present(navController, animated: true)
    }
    private func setupUI() {
        
        let addBudgetcategoryButton = UIBarButtonItem(title: "Add category", style: .done, target: self, action: #selector(showAddBudgetCategory))
        self.navigationItem.rightBarButtonItem = addBudgetcategoryButton
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Budget"
    }
}

