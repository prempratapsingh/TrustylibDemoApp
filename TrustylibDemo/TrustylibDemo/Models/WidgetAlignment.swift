//
//  WidgetAlignment.swift
//  TrustyLib
//
//  Created by Prem Pratap Singh on 01/05/23.
//

import Foundation

/**
 WidgetAlignment defines available alignment types for the widgets
 */
enum WidgetAlignment: CaseIterable {
    case leading, trailing
    
    // MARK: Public properties
    
    // Returns title text for the alignment
    var title: String {
        switch self {
        case .leading: return "Left"
        case .trailing: return "Right"
        }
    }
    
}
