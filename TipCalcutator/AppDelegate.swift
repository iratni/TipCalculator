//
//  AppDelegate.swift
//  TipCalcutator
//
//  Created by Youcef Iratni on 12/9/15.
//  Copyright © 2015 Youcef Iratni. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        var isFirstLoad = userDefaults.boolForKey("is_First_Load")
        //        lowestTip = userDefaults.floatForKey("lowest_tip")
        //        midLowTip = userDefaults.floatForKey("midLow_tip")
        //        midTip = userDefaults.floatForKey("mid_tip")
        //        midHighTip = userDefaults.floatForKey("midHigh_tip")
        //        highestTip = userDefaults.floatForKey("highest_tip")
        
        if(!isFirstLoad){
                userDefaults.setFloat(0.10, forKey: "lowest_tip")
                userDefaults.setFloat(0.15, forKey: "midLow_tip")
                userDefaults.setFloat(0.20, forKey: "mid_tip")
                userDefaults.setFloat(0.25, forKey: "midHigh_tip")
                userDefaults.setFloat(0.30, forKey: "highest_tip")
                userDefaults.setBool(true, forKey: "is_First_Load")
                userDefaults.synchronize()
                  }
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}
