//
//  WidgetModel.swift
//  TrustyLib
//
//  Created by Prem Pratap Singh on 01/05/23.
//

import Foundation

/**
 WidgetModel contains data (id, type, tsid, channel id, product id, etc) for a given trustbadge widget.
 */
class WidgetModel {
    var id: String
    var type: WidgetType
    var alignment: WidgetAlignment
    var tsId: String
    var channelId: String?
    var productId: String?
    
    // MARK: - Initializer
    
    init(
        type: WidgetType,
        alignment: WidgetAlignment,
        tsId: String,
        channelId: String? = nil,
        productId: String? = nil) {
            self.id = UUID().uuidString
            self.type = type
            self.alignment = alignment
            self.tsId = tsId
            self.channelId = channelId
            self.productId = productId
    }
}
