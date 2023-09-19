//
//  HomeView.swift
//  TrustyLib
//
//  Created by Prem Pratap Singh on 01/05/23.
//

import SwiftUI
import Trustylib

/**
 HomeView presents the root view of the application with a user inteface for helping users
 select different input parameters for Trustbadge widget and create new widgets based on those parameters.
 
 A list view shows UI/UX for newly created and previously created widget.
 */
struct HomeView: View {
    
    // MARK: - Private properties
    @Environment(\.colorScheme) var colorScheme
    @StateObject private var viewModel = HomeViewModel()
    @State private var isTrustbadgeVisible = true
    @State private var didGenerateWidget = false
    @State private var orderDetails: OrderDetailsModel?
    @State private var trustcardState: TrustcardState?
    
    // MARK: - User interface
    
    var body: some View {
        ZStack {
            
            // Background color
            if self.colorScheme == .light {
                Color.tsOffwhite
                    .ignoresSafeArea()
            } else {
                Color.tsGray800
                    .ignoresSafeArea()
            }
            
            // Yellow cloud graphics
            Image("waveBottomRight")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width, height: 250)
                .position(x: UIScreen.main.bounds.width * 0.5, y: UIScreen.main.bounds.height - 30)
            
            // Main content
            
            VStack(alignment: .leading, spacing: 14) {
                
                // Title text
                Text("TrustyLib Demo")
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(self.colorScheme == .light ? .tsBlue700 : .tsBlue500)
                Text("Trustylib library provides easy to integrate TrustedShops Trustmark, Shop Grade, Product Grade and Buyer Protection widgets for iOS and Android applications.")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(self.colorScheme == .light ? .tsGray800 : .tsGray200)
                Text("Please checkout library's [Git Project](https://github.com/trustedshops-public/etrusted-ios-trustbadge-library) for more details about the available widgets, usage guides, etc.")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(self.colorScheme == .light ? .tsGray800 : .tsGray200)
                    .padding(.bottom, 10)
                
                Text("Please select a shop, supported widget type, product (if available), alignment and tap on 'Generate Widget' button to display the widget")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(self.colorScheme == .light ? .tsGray700 : .tsGray300)
                
                // Trustbadge input fields
                VStack(alignment: .leading, spacing: 24) {
                    
                    // Channel Id
                    HStack(alignment: .center, spacing: 10) {
                        Text("Shop")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(self.colorScheme == .light ? .tsGray700 : .tsGray300)
                            .frame(width: 80, alignment: .trailing)
                        
                        Menu {
                            ForEach(Channel.allCases, id: \.self) { channel in
                                Button(
                                    channel.name,
                                    action: {
                                        self.viewModel.updateChannelSelection(channel)
                                    }
                                )
                            }
                        }
                        label: {
                            HStack(alignment: .center, spacing: 0) {
                                Text(self.viewModel.selectedChannel.name)
                                    .font(.system(size: 12, weight: .regular))
                                    .frame(width: 200)
                                    .foregroundColor(.tsGray700)

                                Image(systemName: "arrow.down")
                                    .symbolRenderingMode(.monochrome)
                                    .foregroundColor(Color.tsGray600)
                                    .font(.system(size: 12, weight: .regular))
                            }
                            .padding(.all, 5)
                            .padding(.horizontal, 5)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.tsGray100)
                                    .frame(height: 35)
                            )
                        }
                    }
                    
                    // Widget type
                    HStack(alignment: .center, spacing: 10) {
                        Text("Widget")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(self.colorScheme == .light ? .tsGray700 : .tsGray300)
                            .frame(width: 80, alignment: .trailing)
                        
                        Menu {
                            ForEach(self.viewModel.selectedChannel.supportedWidgets, id: \.self) { widgetType in
                                Button(
                                    widgetType.title,
                                    action: {
                                        self.viewModel.selectedWidgetType = widgetType
                                    }
                                )
                            }
                        }
                        label: {
                            HStack(alignment: .center, spacing: 0) {
                                Text(self.viewModel.selectedWidgetType.title)
                                    .font(.system(size: 12, weight: .regular))
                                    .frame(width: 200)
                                    .foregroundColor(Color.tsGray700)

                                Image(systemName: "arrow.down")
                                    .symbolRenderingMode(.monochrome)
                                    .foregroundColor(Color.tsGray600)
                                    .font(.system(size: 12, weight: .regular))
                            }
                            .padding(.all, 5)
                            .padding(.horizontal, 5)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.tsGray100)
                                    .frame(height: 30)
                            )
                        }
                    }
                    
                    // Product Id
                    if self.viewModel.selectedWidgetType == .productGrade,
                       let products = self.viewModel.selectedChannel.products,
                       !products.isEmpty {
                        
                        HStack(alignment: .center, spacing: 10) {
                            Text("Product")
                                .font(.system(size: 14, weight: .regular))
                                .frame(width: 80, alignment: .trailing)
                                .foregroundColor(self.colorScheme == .light ? .tsGray700 : .tsGray300)
                                
                            Menu {
                                ForEach(products, id: \.self) { product in
                                    Button(
                                        product.name,
                                        action: {
                                            self.viewModel.updateProductSelection(product)
                                        }
                                    )
                                }
                            }
                            label: {
                                HStack(alignment: .center, spacing: 0) {
                                    Text(self.viewModel.selectedProduct?.name ?? "")
                                        .font(.system(size: 12, weight: .regular))
                                        .frame(width: 200)
                                        .foregroundColor(Color.tsGray700)

                                    Image(systemName: "arrow.down")
                                        .symbolRenderingMode(.monochrome)
                                        .foregroundColor(Color.tsGray600)
                                        .font(.system(size: 12, weight: .regular))
                                }
                                .padding(.all, 5)
                                .padding(.horizontal, 5)
                                .background(
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color.tsGray100)
                                        .frame(height: 30)
                                )
                            }
                        }
                    }
                    
                    // Widget alignment
                    HStack(alignment: .center, spacing: 10) {
                        Text("Alignment")
                            .font(.system(size: 14, weight: .regular))
                            .frame(width: 80, alignment: .trailing)
                            .foregroundColor(self.colorScheme == .light ? .tsGray700 : .tsGray300)
                            
                        Menu {
                            ForEach(WidgetAlignment.allCases, id: \.self) { alignment in
                                Button(
                                    alignment.title,
                                    action: {
                                        self.viewModel.selectedWidgetAlignment = alignment
                                    }
                                )
                            }
                        }
                        label: {
                            HStack(alignment: .center, spacing: 0) {
                                Text(self.viewModel.selectedWidgetAlignment.title)
                                    .font(.system(size: 12, weight: .regular))
                                    .frame(width: 200)
                                    .foregroundColor(Color.tsGray700)

                                Image(systemName: "arrow.down")
                                    .symbolRenderingMode(.monochrome)
                                    .foregroundColor(Color.tsGray600)
                                    .font(.system(size: 12, weight: .regular))
                            }
                            .padding(.all, 5)
                            .padding(.horizontal, 5)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.tsGray100)
                                    .frame(height: 30)
                            )
                        }
                    }
                }
                .padding(.bottom, 10)
                
                // Generate widget button
                Button(action: {
                    self.viewModel.addNewWidgetWith(
                        orderDetails: self.$orderDetails,
                        trustCardState: self.$trustcardState
                    )
                    self.didGenerateWidget = true
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(self.colorScheme == .light ? Color.tsBlue700 : Color.tsBlue500)
                            .frame(height: 40)
                        
                        Text("Generate Widget")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(Color.white)
                    }
                }
                
                // Show Trustcard view button
                if self.viewModel.selectedWidgetType == .buyerProtection {
                    Button(action: {
                        self.orderDetails = OrderDetailsModel(number: "123", amount: 789, currency: .eur, paymentType: "credit-card", estimatedDeliveryDate: "23-11-2023", buyerEmail: "abc@xyz.com")
                        self.trustcardState = .classicProtection
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.clear)
                                .frame(height: 25)
                            
                            Text("Show Trustcard")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(self.colorScheme == .light ? Color.tsBlue700 : Color.tsBlue500)
                        }
                    }
                }
                
                // Seperator line
                Rectangle()
                    .fill(Color.tsGray200)
                    .frame(height: 1)
                
                ZStack {
                    // Mock content
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Below texts show a vertical scroll pane. \n__Scroll up and down__ to see how the Trustbadge widget's visibility is managed.")
                                .foregroundColor(self.colorScheme == .light ? Color.tsBlue600 : Color.tsBlue500)
                                .font(.system(size: 16, weight: .regular))
                                .padding(.bottom, 12)
                            
                            ForEach(0..<20, id: \.self) { index in
                                Text(self.viewModel.selectedWidgetType.description)
                                    .foregroundColor(self.colorScheme == .light ? Color.tsGray300 : Color.tsGray600)
                                    .font(.system(size: 14))
                                    .opacity(0.6)
                            }
                            
                            GeometryReader { proxy in
                                let offset = proxy.frame(in: .named("scroll")).minY
                                Color.clear.preference(key: ScrollViewOffsetPreferenceKey.self, value: offset)
                            }
                        }
                        .onPreferenceChange(ScrollViewOffsetPreferenceKey.self) { value in
                            self.isTrustbadgeVisible = value >= self.viewModel.scrollOffset
                        }
                    }
                    
                    // Trustbadge widgets
                    VStack(alignment: .leading, spacing: 24) {
                        ForEach(self.viewModel.widgetsData, id: \.self.id) { widgetData in
                            TrustbadgeWidget(widgetData: widgetData)
                                .opacity(self.isTrustbadgeVisible ? 1 : 0)
                                .animation(.easeIn(duration: 0.2), value: self.isTrustbadgeVisible)
                        }
                    }
                    .offset(y: self.viewModel.selectedWidgetType == .buyerProtection ? 40 : 60)
                }
                .opacity(self.didGenerateWidget ? 1 : 0)
                .animation(.easeIn(duration: 0.2), value: self.didGenerateWidget)
                
                Spacer()
                
            }
            .padding(.top, 50)
            .frame(
                width: UIScreen.main.bounds.width - 32,
                height: UIScreen.main.bounds.height
            )
        }
        .onAppear {
            self.viewModel.updateChannelSelection(self.viewModel.selectedChannel)
        }
    }
}

struct ScrollViewOffsetPreferenceKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}
