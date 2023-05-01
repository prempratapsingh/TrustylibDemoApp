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
        case .productOne: return "31303033" // Demo Shop - DINING CHAIR
        case .productTwo: return "31303030" // Demo Shop - COUCH WITH RECAMIERE
        case .productThree: return "31303035" // Demo Shop - VINTAGE SIDEBOARD
        }
    }
    
    var name: String {
        switch self {
        case .none: return "Select"
        case .productOne: return "DINING CHAIR"
        case .productTwo: return "COUCH WITH RECAMIERE"
        case .productThree: return "VINTAGE SIDEBOARD"
        }
    }
}
