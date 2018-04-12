//
//  AppDelegate.swift
//  FirebaseTest
//
//  Created by Paulo Coutinho on 12/04/18.
//  Copyright © 2018 Paulo Coutinho. All rights reserved.
//

import UIKit

import FirebaseCore
import FirebaseMessaging

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, MessagingDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // fireabse
        FirebaseApp.configure()

        // push notification
        let settings: UIUserNotificationSettings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
        application.registerUserNotificationSettings(settings)
        application.registerForRemoteNotifications()
        
        Messaging.messaging().delegate = self
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
        if application.applicationState == .active {
            processRemoteNotification(data: userInfo)
        }
    }
    
    func processRemoteNotification(data: [AnyHashable : Any]) {
        print("New remote notification received")
        print(data)
        
        guard let dataAPS = data["aps"] as? [AnyHashable : Any] else {
            print("Invalid remote notification data received")
            return
        }
        
        var title = "Message"
        var body = "New remote message received"
        
        if let data = dataAPS["alert"] as? [AnyHashable : Any] {
            // check if alert is another hash
            title = data["title"] as! String
            body = data["body"] as! String
        } else if let data = dataAPS["alert"] as? String {
            // check if alert is string
            body = data
        }
        
        let alert = UIAlertController(title: title, message: body, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
        print("FCM push token: \(fcmToken)")
    }

}

