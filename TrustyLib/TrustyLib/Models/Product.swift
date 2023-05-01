//
//  Product.swift
//  TrustyLib
//
//  Created by Prem Pratap Singh on 01/05/23.
//

import Foundation

/**
 ProductId enumeration provides list of available product id and their properties
 */
enum Product: CaseIterable {
    case none, productOne, productTwo, productThree
    
    // Mark:- Public properties
    
    var id: String {
        switch self {
        case .none: return "Select"
        case .productOne: return "31303033" // Demo Shop - Dining Chair
        case .productTwo: return "31303030" // Demo Shop - Couch With Recamiere
        case .productThree: return "31303035" // Demo Shop - Vintage Sideboard
        }
    }
    
    var name: String {
        switch self {
        case .none: return "Select"
        case .productOne: return "Dining Chair"
        case .productTwo: return "Couch With Recamiere"
        case .productThree: return "Vintage Sideboard"
        }
    }
}
