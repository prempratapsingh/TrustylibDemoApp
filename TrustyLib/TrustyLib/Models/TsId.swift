//
//  TsId.swift
//  TrustyLib
//
//  Created by Prem Pratap Singh on 01/05/23.
//

import Foundation

/**
 TsId enumeration provides list of available ids and their properties
 */
enum TsId: CaseIterable {
    case none, tsidOne, tsidTwo
    
    // Mark:- Public properties
    
    var id: String {
        switch self {
        case .none: return "Select"
        case .tsidOne: return "X7D443073561DAED877CDCD28E7FABEF5" // Trusted Shops DemoShop CH
        case .tsidTwo: return "X6C34CF4498287272C62DAD6AF56F6BCC" // 210310cztest.de
        }
    }
    
    var name: String {
        switch self {
        case .none: return ""
        case .tsidOne: return "Trusted Shops DemoShop CH"
        case .tsidTwo: return "210310cztest.de"
        }
    }
}
