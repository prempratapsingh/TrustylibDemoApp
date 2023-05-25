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
    case basicTShirtsHerren, magazine, rollUpClassic, nonWovenTaschen, mikrofaserHandtcher
    case diningChair, doubleCouchGreen, couchSystemGray
    
    // Mark:- Public properties
    
    var id: String {
        switch self {
        case .basicTShirtsHerren: return "46432d34333837383331"
            // https://www.flyeralarm.com/de/p/basic-t-shirts-herren-4387831.html
        case .magazine: return "46432d34323532303339"
            // https://www.flyeralarm.com/de/p/magazine-mit-rueckendrahtheftung-klassiker-4252039.html
        case .rollUpClassic: return "46432d34323431333034"
            // url - https://www.flyeralarm.com/de/p/roll-up-classic-system-inkl-druck-4241304.html
        case .nonWovenTaschen: return "46432d34323235333839"
            // https://www.flyeralarm.com/de/p/non-woven-tasche-4225389.html
        case .mikrofaserHandtcher: return "46432d39343030383835"
            // https://www.flyeralarm.com/de/p/mikrofaser-handtuecher-9400885.html
        case .diningChair: return "31303033"
            // https://demoshop.trustedshops.com/en/home/10-42-brown-bear-cushion.html
        case .doubleCouchGreen: return "31303032"
            // https://demoshop.trustedshops.com/en/living/11-hummingbird-cushion.html
        case .couchSystemGray: return "31303031"
            // https://demoshop.trustedshops.com/en/home/17-brown-bear-notebook.html
        }
    }
    
    var name: String {
        switch self {
        case .basicTShirtsHerren: return "Basic T-Shirts Herren"
        case .magazine: return "Magazine"
        case .rollUpClassic: return "Roll up classic"
        case .nonWovenTaschen: return "Non Woven Taschen"
        case .mikrofaserHandtcher: return "Mikrofaser Handtücher"
        case .diningChair: return "Dining Chair"
        case .doubleCouchGreen: return "Double Couch Green"
        case .couchSystemGray: return "Couch System Grey"
        }
    }
}
