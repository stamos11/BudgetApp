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
        
    }


}

