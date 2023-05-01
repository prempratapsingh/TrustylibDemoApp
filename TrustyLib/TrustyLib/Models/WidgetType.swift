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
}
