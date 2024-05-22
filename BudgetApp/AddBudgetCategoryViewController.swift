//
//  AddBudgetCategoryViewController.swift
//  BudgetApp
//
//  Created by stamoulis nikolaos on 20/5/24.
//

import Foundation
import UIKit
import CoreData

class AddBudgetCategoryViewController: UIViewController {
    
    private var persistentContainer: NSPersistentContainer
    
    private var isFormValid: Bool {
        guard let name = nameTextField.text, let amount = amountTextField.text else {
            return false
        }
         return !name.isEmpty && !amount.isEmpty && amount.isNumeric && amount.isGreaterThan(0)
    }
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Budget name"
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .darkGray
        return textField
    }()
    lazy var amountTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Budget amount"
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .darkGray
        return textField
    }()
    lazy var addBudgetButton: UIButton = {
        var config = UIButton.Configuration.bordered()
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save", for: .normal)
        return button
    }()
    lazy var errorMessageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.text = ""
        label.numberOfLines = 0
        return label
    }()
    
    init(persistentContainer: NSPersistentContainer) {
        self.persistentContainer = persistentContainer
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Add budget"
        view.backgroundColor = .gray
        setupUI()
    }
    
    @objc func addBudgetButtonPressed(_ sender: UIButton) {
        if isFormValid {
            //Save Budget
            saveBudgetCategory()
        } else {
            errorMessageLabel.text = "Unable to save budget. Budget name amount is required"
        }
    }
    private func saveBudgetCategory() {
        guard let name = nameTextField.text, let amount = amountTextField.text else {
            return
        }
        do {
            let budgerCategory = BudgetCategory(context: persistentContainer.viewContext)
            budgerCategory.name = name
            budgerCategory.amount = Double(amount) ?? 0.0
            try persistentContainer.viewContext.save()
            dismiss(animated: true)
        } catch {
            errorMessageLabel.text = "Unable to save budget name and amount is required"
        }
    }
    private func setupUI() {
        
    let stackView = UIStackView()
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = UIStackView.spacingUseSystem
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
        
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(amountTextField)
        stackView.addArrangedSubview(addBudgetButton)
        stackView.addArrangedSubview(errorMessageLabel)
        
        nameTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        amountTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        addBudgetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        addBudgetButton.addTarget(self, action: #selector(addBudgetButtonPressed), for: .touchUpInside)
        
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}


