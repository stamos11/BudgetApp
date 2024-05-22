//
//  Double+Extensions.swift
//  BudgetApp
//
//  Created by stamoulis nikolaos on 22/5/24.
//

import Foundation

extension Double {
    
    func formatAsCurrency() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: self)) ?? "0.00"
    }
}
