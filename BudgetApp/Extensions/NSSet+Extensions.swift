//
//  NSSet+Extensions.swift
//  BudgetApp
//
//  Created by stamoulis nikolaos on 23/5/24.
//

import Foundation

extension NSSet {
    
    func toArray<T>() -> [T] {
        let array = self.map { $0 as! T }
        return array
    }
}
