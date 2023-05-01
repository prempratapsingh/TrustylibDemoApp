//
//  HomeViewModel.swift
//  TrustyLib
//
//  Created by Prem Pratap Singh on 01/05/23.
//

import Foundation

/**
 HomeViewModel works as the view model of the Home view, providing the business logic
 for home view related user gestures, events, data and related workflows.
 */
class HomeViewModel: ObservableObject {
    
    // MARK: - Public properties
    
    @Published var widgets: [WidgetModel] = []
    
    @Published var areRequiredInputsProvided: Bool = false
    @Published var selectedWidgetType: WidgetType = .trustMark
    @Published var selectedWidgetAlignment: WidgetAlignment = .leading
    @Published var selectedTsId: TsId = .none
    @Published var selectedChannel: Channel = .none
    @Published var selectedProduct: Product = .none
    
    // MARK: - Public methods
    
    /**
     Adds a new widget data object to the list of widget data
     */
    func addNewWidgetWith(
        type: WidgetType,
        alignment: WidgetAlignment,
        tsId: String,
        channelId: String? = nil,
        productId: String? = nil) {
            let widget = WidgetModel(
                type: type,
                alignment: alignment,
                tsId: tsId,
                channelId: channelId,
                productId: productId
            )
            
            self.widgets.append(widget)
    }
    
    /**
     Checks if user provided all required inputs for the selected widget type
     */
    func checkIfRequiredInputsAreProvided() {
        self.areRequiredInputsProvided = false
        
        switch self.selectedWidgetType {
        case .trustMark, .shopGrade, .buyerProtection:
            self.areRequiredInputsProvided = self.selectedChannel != .none
            return
        case .productGrade:
            self.areRequiredInputsProvided = self.selectedChannel != .none && self.selectedProduct != .none
            return
        }
    }
}
