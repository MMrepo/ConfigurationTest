//
//  TrackedScreensConfiguration.swift
//  ConfigurationTest
//
//  Created by Mateusz Małek on 03.12.2015.
//  Copyright © 2015 Mateusz Małek. All rights reserved.
//

import Foundation

class TrackedScreensConfiguration: ConfigurationObject {
    
    let printAction:ConfigurationObjectAction = { (label) -> Void in
        print("trackScreen: \(label)")
    }
    
    override init(withDictionary configurationsDictionary:NSDictionary, forKey key:String) throws {
        try super.init(withDictionary: configurationsDictionary, forKey: key)
        try self.setAction(printAction)
    }
    
}