//
//  ViewController.swift
//  BudgetApp
//
//  Created by stamoulis nikolaos on 20/5/24.
//

import UIKit
import CoreData

class BudgetCategoriesTableViewController: UITableViewController {

    //MARK: -Properties
    private var persistentContainer: NSPersistentContainer
    private var fetchedResultController: NSFetchedResultsController<BudgetCategory>!
    
    init(persistentContainer: NSPersistentContainer) {
        self.persistentContainer = persistentContainer
        super.init(nibName: nil, bundle: nil)
        
        let request = BudgetCategory.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        
        fetchedResultController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultController.delegate = self
        
        do {
            try fetchedResultController.performFetch()
        } catch {
            print(error.localizedDescription)
        }
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
        
        // cell register
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "BudgetTableViewCell")
        
      
    }
    //UITableViewDelegate Functions
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (fetchedResultController.fetchedObjects ?? []).count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BudgetTableViewCell", for: indexPath)
        let budgetCategory = fetchedResultController.object(at: indexPath)
        var configuration = cell.defaultContentConfiguration()
        configuration.text = budgetCategory.name
        cell.contentConfiguration = configuration
        return cell
    }
    
}

extension BudgetCategoriesTableViewController: NSFetchedResultsControllerDelegate {
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<any NSFetchRequestResult>) {
        tableView.reloadData()
    }
}

