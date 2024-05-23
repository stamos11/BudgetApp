//
//  BudgetCategory+CoreDataClass.swift
//  BudgetApp
//
//  Created by stamoulis nikolaos on 23/5/24.
//

import Foundation
import CoreData

@objc(BudgetCategory)
public class BudgetCategory: NSManagedObject {
    
    var transactionTotal: Double {
        let transactionsArray: [Transaction] = tranactions?.toArray() ?? []
        return transactionsArray.reduce(0) { next, transaction in
            next + transaction.amount
            
        }
    }
    var remainingAmount: Double {
        amount - transactionTotal
    }
}
