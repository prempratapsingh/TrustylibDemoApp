//
//  TrustbadgeWidget.swift
//  TrustyLib
//
//  Created by Prem Pratap Singh on 01/05/23.
//

import SwiftUI
import Trustylib

/**
 TrustbadgeWidget shows the widget UI/UX and content from given widget data
 */
struct TrustbadgeWidget: View {
    
    // MARK: - Public properties
    var widgetData: WidgetModel
    
    // MARK: - User Interface
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            if self.widgetData.type == .trustMark {
                TrustbadgeView(
                    tsId: self.widgetData.channel.tsId,
                    context: .trustMark,
                    alignment: self.widgetData.alignment == .leading ? .leading : .trailing
                )
                .frame(height: 75)
            } else if self.widgetData.type == .shopGrade {
                TrustbadgeView(
                    tsId: self.widgetData.channel.tsId,
                    channelId: self.widgetData.channel.id,
                    context: .shopGrade,
                    alignment: self.widgetData.alignment == .leading ? .leading : .trailing
                )
                .frame(height: 75)
            } else if self.widgetData.type == .buyerProtection {
                TrustbadgeView(
                    tsId: self.widgetData.channel.tsId,
                    channelId: self.widgetData.channel.id,
                    context: .buyerProtection,
                    alignment: self.widgetData.alignment == .leading ? .leading : .trailing
                )
                .frame(height: 75)
            } else if self.widgetData.type == .productGrade, let product = self.widgetData.product {
                TrustbadgeView(
                    tsId: self.widgetData.channel.tsId,
                    channelId: self.widgetData.channel.id,
                    productId: product.id,
                    context: .productGrade,
                    alignment: self.widgetData.alignment == .leading ? .leading : .trailing
                )
                .frame(height: 75)
            }
        }
    }
}
