//
//  NSObject+SwiftClassFromString.swift
//  ConfigurationTest
//
//  Created by Mateusz Małek on 09.12.2015.
//  Copyright © 2015 Mateusz Małek. All rights reserved.
//

import Foundation

extension NSObject {
    
    class func swiftClassFromString(className: String) -> AnyClass? {
        var classObject:AnyClass? = NSClassFromString(className)
        if  let appName: String = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleName") as? String where classObject == nil {
            
            let classStringName = "_TtC\(appName.characters.count)\(appName)\(className.characters.count)\(className)"
            classObject = NSClassFromString(classStringName)
        }
        return classObject
    }
}