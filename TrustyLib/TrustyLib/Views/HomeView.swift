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
    
    @StateObject private var viewModel = HomeViewModel()
    
    // MARK: - User interface
    
    var body: some View {
        ZStack {
            
            // Background color
            Color.tsOffwhite
                .ignoresSafeArea()
            
            // Main content
            
            VStack(alignment: .leading, spacing: 16) {
                
                // Title text
                Text("TrustyLib")
                    .font(.system(size: 28, weight: .semibold))
                    .foregroundColor(.tsBlue700)
                Text("Trustylib library provides easy to integrate TrustedShops Trustmark, Shop Grade, Product Grade and Buyer Protection widgets for iOS and Android applications.")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(.tsGray800)
                Text("Please checkout library's [Git Project](https://github.com/trustedshops-public/etrusted-ios-trustbadge-library) for more details about the available widgets, usage guides, etc.")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(.tsGray800)
                    .padding(.bottom, 10)
                
                Text("Please select widget type, its properties and tap on 'Generate Widget' button to generate and display the desired widget")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.tsGray700)
                
                // Trustbadge input fields
                VStack(alignment: .leading, spacing: 24) {
                    // Widget type
                    HStack(alignment: .center, spacing: 10) {
                        Text("Widget")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(.tsGray700)
                            .frame(width: 80, alignment: .trailing)
                        
                        Menu {
                            ForEach(WidgetType.allCases, id: \.self) { widgetType in
                                Button(
                                    widgetType.title,
                                    action: {
                                        self.viewModel.selectedWidgetType = widgetType
                                        self.viewModel.checkIfRequiredInputsAreProvided()
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
                    
                    // Channel Id
                    HStack(alignment: .center, spacing: 10) {
                        Text("Shop")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(.tsGray700)
                            .frame(width: 80, alignment: .trailing)
                        
                        Menu {
                            ForEach(Channel.allCases, id: \.self) { channel in
                                Button(
                                    channel.name,
                                    action: {
                                        self.viewModel.selectedChannel = channel
                                        self.viewModel.checkIfRequiredInputsAreProvided()
                                    }
                                )
                            }
                        }
                        label: {
                            HStack(alignment: .center, spacing: 0) {
                                Text(self.viewModel.selectedChannel.name)
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
                                    .frame(height: 35)
                            )
                        }
                    }
                    
                    // Product Id
                    if self.viewModel.selectedWidgetType == .productGrade {
                        HStack(alignment: .center, spacing: 10) {
                            Text("Product")
                                .font(.system(size: 14, weight: .regular))
                                .frame(width: 80, alignment: .trailing)
                                .foregroundColor(.tsGray700)
                                
                            Menu {
                                ForEach(Product.allCases, id: \.self) { product in
                                    Button(
                                        product.name,
                                        action: {
                                            self.viewModel.selectedProduct = product
                                            self.viewModel.checkIfRequiredInputsAreProvided()
                                        }
                                    )
                                }
                            }
                            label: {
                                HStack(alignment: .center, spacing: 0) {
                                    Text(self.viewModel.selectedProduct.name)
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
                            .foregroundColor(.tsGray700)
                            
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
                .padding(.bottom, 20)
                
                // Generate widget button
                Button(action: {
                    self.viewModel.addNewWidgetWith()
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.tsBlue500)
                            .frame(height: 40)
                        
                        Text("Generate Widget")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(Color.white)
                    }
                    .opacity(self.viewModel.areRequiredInputsProvided ? 1 : 0.6)
                }
                .disabled(!self.viewModel.areRequiredInputsProvided)
                
                // Seperator line
                Rectangle()
                    .fill(Color.tsGray200)
                    .frame(height: 1)
                
                // Trustbadge widgets
                VStack(alignment: .leading, spacing: 24) {
                    ForEach(self.viewModel.widgetsData, id: \.self.id) { widgetData in
                        TrustbadgeWidget(widgetData: widgetData)
                    }
                }
                .padding(.top, 10)
                
                Spacer()
                
            }
            .padding(.top, 60)
            .frame(
                width: UIScreen.main.bounds.width - 32,
                height: UIScreen.main.bounds.height
            )
            
            Image("waveBottomRight")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width, height: 250)
                .position(x: UIScreen.main.bounds.width * 0.5, y: UIScreen.main.bounds.height - 30)
        }
    }
}
