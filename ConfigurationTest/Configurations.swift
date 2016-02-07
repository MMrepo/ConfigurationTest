//
//  Configurations.swift
//  ConfigurationTest
//
//  Created by Mateusz Małek on 03.12.2015.
//  Copyright © 2015 Mateusz Małek. All rights reserved.
//

import Foundation

class Configurations {
    
    static let configurationPathFileName = "Configurations"
    
    class func initialize() {
      // load configuration from plist
        let filePath = NSBundle.mainBundle().pathForResource(configurationPathFileName, ofType: "plist")!
        if let dictionary = NSDictionary(contentsOfFile:filePath) {
            do {
              let trackedScreensConfiguration = try TrackedScreensConfiguration(withDictionary: dictionary, forKey: "trackedScreens")
              let trackedButtonsConfiguration = try TrackedButtonClickedConfiguration(withDictionary: dictionary, forKey: "trackedButtons")
            } catch let error {
                print(error)
            }
        }
    }
}