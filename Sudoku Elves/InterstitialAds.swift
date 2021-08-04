//
//  InterstitialAds.swift
//  Sudoku Elves
//
//  Created by Cubik65536 on 2021-07-13.
//

import GoogleMobileAds
import UIKit

final class Interstitial:NSObject, GADFullScreenContentDelegate{
    private var adUnitID = "ca-app-pub-4483819806888754/9710902432"
    // Test ⬇️
//    private var adUnitID = "ca-app-pub-3940256099942544/1033173712"
    
    var interstitial: GADInterstitialAd?
    
    override init() {
        super.init()
        LoadInterstitial()
    }
    
    func LoadInterstitial(){
        let request = GADRequest()
        GADInterstitialAd.load(withAdUnitID: adUnitID,
                               request: request,
                               completionHandler: { (ad, error) in
                                if let error = error {
                                    print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                                    return
                                }
                                self.interstitial = ad
                                self.interstitial?.fullScreenContentDelegate = self
                               }
        )
    }
    
    func showAd(){
        print("showAds")
        LoadInterstitial()
        if let ad = interstitial {
            let root = UIApplication.shared.windows.first?.rootViewController
            ad.present(fromRootViewController: root!)
        } else {
            print("Ad wasn't ready")
        }
    }
    
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        LoadInterstitial()
    }
}
