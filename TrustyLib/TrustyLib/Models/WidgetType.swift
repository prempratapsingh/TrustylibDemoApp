//
//  WidgetType.swift
//  TrustyLib
//
//  Created by Prem Pratap Singh on 01/05/23.
//

import Foundation

/**
 WidgetType enum defines types of available widgets and their properties
 */
enum WidgetType: CaseIterable {
    case trustMark, shopGrade, productGrade, buyerProtection
    
    // MARK: Public properties
    
    // Returns title text of the widget
    var title: String {
        switch self {
        case .trustMark: return "Trustmark"
        case .shopGrade: return "Shop Grade"
        case .productGrade: return "Product Grade"
        case .buyerProtection: return "Buyer Protection"
        }
    }
    
    var description: String {
        switch self {
        case .trustMark: return "Trustmark widget shows the validity of your trust certificate issued by Trusted Shops."
        case .shopGrade: return "Shop Grade widget expands to show shop rating and status (Excellent, Good, Fair, etc) with a nice animated effect. The widget however shows the aggregate rating and status only, it doesn't show shop actual reviews' details like review text, review date, attachments, etc."
        case .productGrade: return "Product Grade widget shows product image, rating and status (Excellent, Good, Fair, etc) with an animated user interface."
        case .buyerProtection: return "Buyer Protection widget shows details about shop's buyer protection amount."
        }
    }
}
