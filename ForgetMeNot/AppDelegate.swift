/*
 * Copyright (c) 2017 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit
import Firebase
import UserNotifications
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  let locationManager = CLLocationManager()
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    locationManager.delegate = self
    
        FIRApp.configure()
    
    // Request permission to send notifications
    let center = UNUserNotificationCenter.current()
    center.requestAuthorization(options:[.alert, .sound]) { (granted, error) in }
    
    return true
  }
	
}

// MARK: CLLocationManagerDelegate
//extension AppDelegate: CLLocationManagerDelegate {
//  func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
//    guard region is CLBeaconRegion else { return }
//
//    let content = UNMutableNotificationContent()
//    content.title = "Forget Me Not"
//    content.body = "Are you forgetting something?"
//    content.sound = .default()
//
//    let request = UNNotificationRequest(identifier: "ForgetMeNot", content: content, trigger: nil)
//    UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
//  }
//}

extension AppDelegate : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
            guard region is CLBeaconRegion else { return }
        
            let content = UNMutableNotificationContent()
            content.title = "11월 둘쨔주 금요일"
            content.body = "오늘은 금요일입니다. 다들 불금 보내세요~!"
            content.sound = .default()
        
            let request = UNNotificationRequest(identifier: "ForgetMeNot", content: content, trigger: nil)
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
//    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
//        guard region is CLBeaconRegion else { return }
//        
//        let content = UNMutableNotificationContent()
//        content.title = "Forget Me Not"
//        content.body = "(didExitRegion)"
//        content.sound = .default()
//        
//        let request = UNNotificationRequest(identifier: "ForgetMeNot", content: content, trigger: nil)
//        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
//    }
}

