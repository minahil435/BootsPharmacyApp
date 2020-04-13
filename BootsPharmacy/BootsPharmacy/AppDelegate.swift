//
//  AppDelegate.swift
//  BootsPharmacy
//
//  Created by Minahil Shafique on 06/04/2020.
//  Copyright © 2020 Minahil Shafique. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}
@IBDesignable extension UIView {

@IBInspectable var borderUIColor: UIColor? {
    set {
        layer.borderColor = newValue?.cgColor
    }
    get {
        guard let color = layer.borderColor else {
            return nil
        }
        return UIColor(cgColor: color)
    }
}

@IBInspectable var borderUIWidth: CGFloat {
    set {
        layer.borderWidth = newValue
    }
    get {
        return layer.borderWidth
    }
}
     @IBInspectable var shadowColor: UIColor? {
            set {
                layer.shadowColor = newValue!.cgColor
            }
            get {
                if let color = layer.shadowColor {
                    return UIColor.init(cgColor:color)
                }
                else {
                    return nil
                }
            }
        }
        
        /* The opacity of the shadow. Defaults to 0. Specifying a value outside the
         * [0,1] range will give undefined results. Animatable. */
        @IBInspectable var shadowOpacity: Float {
            set {
                layer.shadowOpacity = newValue
            }
            get {
                return layer.shadowOpacity
            }
        }
        
        /* The shadow offset. Defaults to (0, -3). Animatable. */
        @IBInspectable var shadowOffset: CGPoint {
            set {
                layer.shadowOffset = CGSize(width: newValue.x, height: newValue.y)
            }
            get {
                return CGPoint(x: layer.shadowOffset.width, y:layer.shadowOffset.height)
            }
        }
        
        /* The blur radius used to create the shadow. Defaults to 3. Animatable. */
        @IBInspectable var shadowRadius: CGFloat {
            set {
                layer.shadowRadius = newValue
            }
            get {
                return layer.shadowRadius
            }
        }
    }


