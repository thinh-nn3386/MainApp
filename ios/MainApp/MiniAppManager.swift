import Foundation
import React


@objc(MiniappManager)
class MiniappManager: NSObject {
    @objc
    static var isLaunch = false

    @objc(getIsLaunch:withRejecter:)
    func getIsLaunch(resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) {
        resolve(MiniappManager.isLaunch)
    }
    
    @objc(openApp:)
    func openApp(initProps: [String: Any]) {
        if (!MiniappManager.isLaunch){
          MiniappManager.isLaunch = true
            
            var bundleURL = Bundle.main.resourceURL
            bundleURL!.appendPathComponent("MiniApp.bundle")
            DispatchQueue.main.async {
                let rootView = RCTRootView(bundleURL: bundleURL!, moduleName: "MiniApp", initialProperties: initProps, launchOptions: nil)
                let vc = UIViewController()
                vc.modalPresentationStyle = .fullScreen
                vc.view = rootView
                UIApplication.shared.delegate?.window??.rootViewController?.present(vc, animated: true, completion: nil)
                // ReadyWalletSplash.showSplash(inRootView: rootView)
            }
        }
    }
    
    @objc(closeApp)
    func closeApp() {
        if MiniappManager.isLaunch {
            DispatchQueue.main.async {
                UIApplication.shared.delegate?.window??.rootViewController?.dismiss(animated: true, completion: nil)
            }
          MiniappManager.isLaunch = false
        }
    }
}
