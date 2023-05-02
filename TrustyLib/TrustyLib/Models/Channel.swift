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
    case none, channelOne, channelTwo
    
    // Mark:- Public properties
    
    var id: String {
        switch self {
        case .none: return "Select"
        case .channelOne: return "chl-c0ad29ff-a086-4191-a663-82fed64f6f65" // https://demoshop.trustedshops.com/gb
        case .channelTwo: return "chl-b309535d-baa0-40df-a977-0b375379a3cc" // http://www.my.shop/
        }
    }
    
    var tsId: String {
        switch self {
        case .none: return "Select"
        case .channelOne: return "X65D1BEEB9AC82102A10B7976564D05C2"
        case .channelTwo: return "X330A2E7D449E31E467D2F53A55DDD070"
        }
    }
    
    var name: String {
        switch self {
        case .none: return "Select"
        case .channelOne: return "https://demoshop.trustedshops.com/"
        case .channelTwo: return "http://www.my.shop/"
        }
    }
}
