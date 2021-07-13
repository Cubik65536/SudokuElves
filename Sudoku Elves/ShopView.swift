//
//  ShopView.swift
//  Sudoku Elves
//
//  Created by Cubik65536 on 2021-07-13.
//

import SwiftUI
import SwiftyStoreKit

struct ShopView: View {
    @State private var showError: Bool = false
    @State private var errorMessage: String = ""
    @State private var restoreAlert: Bool = false
    @State private var restoreMessage: String = ""
    @State private var removeAdsID: String = "top.cubik65536.app.SudokuElves.RemoveAds"
    @State var removeAdsDesc: String = "Remove Ads in the game"
    @State var removeAdsPrice: String = "3.99$"
    
    var body: some View {
        List() {
            VStack(alignment: .leading) {
                Text("Remove Ads")
                    .font(.headline)
                
                HStack {
                    Text(removeAdsDesc)
                        .font(.subheadline)
                    Spacer()
                    Button(action: {
                        SwiftyStoreKit.purchaseProduct(removeAdsID, quantity: 1, atomically: true) { result in
                            switch result {
                            case .success(let purchase):
                                UserDefaults.standard.set(true, forKey: "AdsRemoved")
                                print("\(LocalizedStringKey("Purchase Success: ").toString())\(purchase.productId)")
                            case .error(let error):
                                switch error.code {
                                case .unknown:
                                    errorMessage = LocalizedStringKey("Unknown error. Please contact support").toString()
                                    showError = true
                                case .clientInvalid:
                                    errorMessage =  LocalizedStringKey("Not allowed to make the payment").toString()
                                    showError = true
                                case .paymentCancelled:
                                    errorMessage = LocalizedStringKey("Payment have been cancelled").toString()
                                    showError = true
                                case .paymentInvalid:
                                    errorMessage = LocalizedStringKey("The purchase identifier was invalid").toString()
                                    showError = true
                                case .paymentNotAllowed:
                                    errorMessage = LocalizedStringKey("The device is not allowed to make the payment").toString()
                                    showError = true
                                case .storeProductNotAvailable:
                                    errorMessage = LocalizedStringKey("The product is not available in the current storefront").toString()
                                    showError = true
                                case .cloudServicePermissionDenied:
                                    errorMessage = LocalizedStringKey("Access to cloud service information is not allowed").toString()
                                    showError = true
                                case .cloudServiceNetworkConnectionFailed:
                                    errorMessage =  LocalizedStringKey("Could not connect to the network").toString()
                                    showError = true
                                case .cloudServiceRevoked:
                                    errorMessage = LocalizedStringKey("User has revoked permission to use this cloud service").toString()
                                    showError = true
                                default:
                                    errorMessage = (error as NSError).localizedDescription
                                    showError = true
                                }
                            }
                        }
                    }) {
                        Text(removeAdsPrice)
                            .font(.subheadline)
                    }.alert(isPresented: $showError) {
                        Alert(
                            title: Text("Error"),
                            message: Text(errorMessage),
                            dismissButton: .default(Text("OK"))
                        )
                    }
                }
            }
            .padding()
            
            VStack(alignment: .leading) {
                Text("Restore Previous Purchases")
                    .font(.headline)
                
                HStack {
                    Text("Reset your purchased items")
                        .font(.subheadline)
                    Spacer()
                    
                    Button(action: {
                        SwiftyStoreKit.restorePurchases(atomically: true) { results in
                            for product in results.restoredPurchases {
                                if results.restoreFailedPurchases.count > 0 {
                                    restoreMessage = LocalizedStringKey("Restore Failed").toString()
                                } else if results.restoredPurchases.count > 0 {
                                    restoreMessage = LocalizedStringKey("Restore Success").toString()
                                    if product.productId == removeAdsID {
                                        UserDefaults.standard.set(true, forKey: "AdsRemoved")
                                    }
                                } else {
                                    restoreMessage = LocalizedStringKey("Nothing to Restore").toString()
                                }
                                restoreAlert = true
                            }
                        }
                    }) {
                        Text("Free")
                            .font(.subheadline)
                    }.alert(isPresented: $restoreAlert) {
                        Alert(
                            title: Text(restoreMessage),
                            dismissButton: .default(Text("OK"))
                        )
                    }
                }
            }
            .padding()
            
        }.onAppear {
            SwiftyStoreKit.retrieveProductsInfo([removeAdsID]) { result in
                if let product = result.retrievedProducts.first {
                    removeAdsDesc = LocalizedStringKey("Remove Ads in the game").toString()
                    removeAdsPrice = product.localizedPrice!
                }
                else if let invalidProductId = result.invalidProductIDs.first {
                    removeAdsDesc = "\(LocalizedStringKey("Invalid product identifier: ").toString())\(invalidProductId)"
                }
                else {
                    removeAdsDesc = "\(LocalizedStringKey("Error: ").toString())\(result.error)"
                }
            }
        }
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}
