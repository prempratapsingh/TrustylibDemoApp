//
//  Channel.swift
//  TrustyLib
//
//  Created by Prem Pratap Singh on 01/05/23.
//

import Foundation

/**
 ChannelId enumeration provides list of available channel id and their properties
 */
enum Channel: CaseIterable {
    case flyerAlarm, tsDemoShop, shopApotheke
    
    // Mark:- Public properties
    
    var id: String {
        switch self {
        case .flyerAlarm: return "chl-3008f896-3b5c-4853-b87d-a91ad337da2d" // https://www.flyeralarm.com/de
        case .tsDemoShop: return "chl-c0ad29ff-a086-4191-a663-82fed64f6f65" // https://demoshop.trustedshops.com/en/
        case .shopApotheke: return "chl-ac2b600f-8a38-4f74-b2ec-ba8f99eb3c7f" //https://www.shop-apotheke.at
        }
    }
    
    var tsId: String {
        switch self {
        case .flyerAlarm: return "X01BF539CC7FA1AF5BEF90441FC58610B"
        case .tsDemoShop: return "X7D443073561DAED877CDCD28E7FABEF5"
        case .shopApotheke: return "X5F2932BF82BE57D0FB09500DE54AA0B1"
        }
    }
    
    var name: String {
        switch self {
        case .flyerAlarm: return "Flyeralarm.com"
        case .tsDemoShop: return "Trustedshops Demo Shop"
        case .shopApotheke: return "Shop-apotheke.at"
        }
    }
    
    var products: [Product]? {
        switch self {
        case .flyerAlarm:
            return [.basicTShirtsHerren, .magazine, .rollUpClassic, .nonWovenTaschen, .mikrofaserHandtcher]
        case .tsDemoShop:
            return [.diningChair, .doubleCouchGreen, .couchSystemGray]
        case .shopApotheke: return []
        }
    }
    
    var supportedWidgets: [WidgetType] {
        switch self {
        case .flyerAlarm, .tsDemoShop: return [.trustMark, .shopGrade, .buyerProtection, .productGrade]
        case .shopApotheke: return [.trustMark, .shopGrade, .buyerProtection]
        }
    }
}
