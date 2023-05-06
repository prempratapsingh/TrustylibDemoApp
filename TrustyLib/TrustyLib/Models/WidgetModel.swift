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
    var channel: Channel
    var product: Product?
    
    // MARK: - Initializer
    
    init(
        type: WidgetType,
        alignment: WidgetAlignment,
        channel: Channel,
        product: Product? = nil) {
            self.id = UUID().uuidString
            self.type = type
            self.alignment = alignment
            self.channel = channel
            self.product = product
    }
}
