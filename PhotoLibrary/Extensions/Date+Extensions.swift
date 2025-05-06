//
//  Date+Extensions.swift
//  PhotoLibrary
//
//  Created by Saadet Şimşek on 30/04/2025.
//

import UIKit

extension Date {
    func getDateDiference() -> String {
        let currentDateInterval = Int(Date().timeIntervalSinceReferenceDate)
        let dateDifferences = Double(currentDateInterval - Int(self.timeIntervalSinceReferenceDate))
        let dateDifferencesDate = Int(round(dateDifferences/86400))
        
        switch dateDifferencesDate {
        case 0:
            return "Today"
        case 1:
            return "Yesterday"
        case 2...4:
            return "\(dateDifferencesDate) days ago"
        default:
            return "\(dateDifferencesDate) days ago"
        }
    }
    
    func formattedDate(formatType: DateFormatType = .full) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "us_EN")
          
            
        switch formatType {
        case .full:
            formatter.dateFormat = "dd MMMM yyyy"
        case .onlyDate:
            formatter.dateFormat = "dd MMMM"
        case .onlyYear:
            formatter.dateFormat = "yyyy"
        }
        
        return formatter.string(from: self)
    }
    
}

enum DateFormatType {
    case full
    case onlyDate
    case onlyYear
}
