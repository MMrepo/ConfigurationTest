//
//  TrackedButtonClickedConfiguration.swift
//  ConfigurationTest
//
//  Created by Mateusz Małek on 07.02.2016.
//  Copyright © 2016 Mateusz Małek. All rights reserved.
//

import Foundation

class TrackedButtonClickedConfiguration: ConfigurationObject {
    
    let printAction:ConfigurationObjectAction = { (label) -> Void in
        let date = NSDate()
        print("buttonClicked: \(label) on \(date)")
    }
    
    override init(withDictionary configurationsDictionary:NSDictionary, forKey key:String) throws {
        try super.init(withDictionary: configurationsDictionary, forKey: key)
        try self.setAction(printAction)
    }
    
}