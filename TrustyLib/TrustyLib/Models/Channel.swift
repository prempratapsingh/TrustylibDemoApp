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
        case .channelTwo: return "chl-c828723a-61d1-4e2a-a763-5524d6cef604" // 210310cztest.de
        }
    }
    
    var tsId: String {
        switch self {
        case .none: return "Select"
        case .channelOne: return "X7D443073561DAED877CDCD28E7FABEF5"
        case .channelTwo: return "X6C34CF4498287272C62DAD6AF56F6BCC"
        }
    }
    
    var name: String {
        switch self {
        case .none: return "Select"
        case .channelOne: return "DemoShop"
        case .channelTwo: return "210310cztest.de"
        }
    }
}
