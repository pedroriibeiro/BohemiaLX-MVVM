//
//  Date+extension.swift
//  bohemiaLX
//
//  Created by Pedro Ribeiro on 30/04/2024.
//

import Foundation

extension Date {
    
    func getDateString(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
        
    }
}
