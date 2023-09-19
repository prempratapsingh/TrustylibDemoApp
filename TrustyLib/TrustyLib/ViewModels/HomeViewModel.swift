//
//  HomeViewModel.swift
//  TrustyLib
//
//  Created by Prem Pratap Singh on 01/05/23.
//

import Foundation
import Trustylib
import SwiftUI

/**
 HomeViewModel works as the view model of the Home view, providing the business logic
 for home view related user gestures, events, data and related workflows.
 */
class HomeViewModel: ObservableObject {
    
    // MARK: - Public properties
    
    @Published var widgetsData: [WidgetModel] = []
    
    @Published var areRequiredInputsProvided: Bool = false
    @Published var selectedWidgetType: WidgetType = .trustMark
    @Published var selectedWidgetAlignment: WidgetAlignment = .leading
    @Published var selectedChannel: Channel = Channel.flyerAlarm
    @Published var selectedProduct: Product? = nil
    @Published var selectedChannelProducts: [Product] = []
    
    var scrollOffset: CGFloat {
        switch self.selectedWidgetType {
        case .trustMark: return 1500
        case .shopGrade: return 2400
        case .productGrade: return 1800
        case .buyerProtection: return 1500
        }
    }
    
    // MARK: - Public methods
    
    /**
     Adds a new widget data object to the list of widget data
     */
    func addNewWidgetWith(
        orderDetails: Binding<OrderDetailsModel?> = .constant(nil),
        trustCardState: Binding<TrustcardState?> = .constant(nil)) {
        let widget = WidgetModel(
            type: self.selectedWidgetType,
            alignment: self.selectedWidgetAlignment,
            channel: self.selectedChannel,
            product: self.selectedProduct,
            orderDetails: orderDetails,
            trustCardState: trustCardState
        )
        self.widgetsData.removeAll()
        self.widgetsData.append(widget)
    }
    
    /**
     Updates details based on selected channel
     */
    func updateChannelSelection(_ channel: Channel) {
        self.selectedChannel = channel
        guard let products = channel.products, !products.isEmpty else {
            self.selectedChannelProducts = []
            self.selectedProduct = nil
            return
        }
        self.selectedChannelProducts = products
        self.selectedProduct = products.first
    }
    
    /**
     Updates selected product reference
     */
    func updateProductSelection(_ product: Product) {
        self.selectedProduct = product
    }
}
