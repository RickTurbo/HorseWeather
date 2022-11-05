////
////  BannerAd.swift
////  HorseWeather
////
////  Created by 児島　陸斗 on 2022/08/25.
////
import SwiftUI
import GoogleMobileAds
import AppTrackingTransparency

// Implementing Banner Ad...
struct BannerAd: UIViewRepresentable {

    var unitID: String

    func makeCoordinator() -> Coordinator {
        // For Implementing Delegates...
        return Coordinator()
    }


    func makeUIView(context: Context) -> GADBannerView {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//            if #available(iOS 14, *) {
//                ATTrackingManager.requestTrackingAuthorization(completionHandler: { status
//                    in
//                    GADMobileAds.sharedInstance().start(completionHandler: nil)
//                })
//            } else {
//                GADMobileAds.sharedInstance().start(completionHandler: nil)
//            }
//        }

        let adView = GADBannerView(adSize: GADAdSizeBanner)
        let request = GADRequest()
        request.scene = UIApplication.shared.connectedScenes.first as? UIWindowScene

        adView.adUnitID = unitID
        adView.rootViewController = UIApplication.shared.getRootViewController()
        adView.delegate = context.coordinator
        adView.load(request)

        return adView
    }

    func updateUIView(_ uiView: GADBannerView, context: Context) {

    }

    class Coordinator: NSObject, GADBannerViewDelegate {

        func bannerViewDidReceiveAd(_ bannerView: GADBannerView) {
            print("bannerViewDidReceiveAd")
        }

        func bannerView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: Error) {
            print("bannerView:didFailToReceiveAdWithError: \(error.localizedDescription)")
        }

        func bannerViewDidRecordImpression(_ bannerView: GADBannerView) {
            print("bannerViewDidRecordImpression")
        }

        func bannerViewWillPresentScreen(_ bannerView: GADBannerView) {
            print("bannerViewWillPresentScreen")
        }

        func bannerViewWillDismissScreen(_ bannerView: GADBannerView) {
            print("bannerViewWillDIsmissScreen")
        }

        func bannerViewDidDismissScreen(_ bannerView: GADBannerView) {
            print("bannerViewDidDismissScreen")
        }
    }
}

// Extending Application to get RootView...
extension UIApplication {
    func getRootViewController() -> UIViewController {

        guard let screen = self.connectedScenes.first as? UIWindowScene else {
            return .init()
        }

        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }

        return root
    }
}
