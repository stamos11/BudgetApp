//
//  String+Extensions.swift
//  BudgetApp
//
//  Created by stamoulis nikolaos on 20/5/24.
//

import Foundation


extension String {
    var isNumeric: Bool {
        Double(self) != nil
    }
    func isGreaterThan(_ value: Double) -> Bool {
        guard self.isNumeric else {
            return false
        }
        return Double(self)! > value
    }
}
