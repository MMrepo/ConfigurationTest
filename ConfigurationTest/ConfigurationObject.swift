//
//  ConfigurationObject.swift
//  ConfigurationTest
//
//  Created by Mateusz Małek on 03.12.2015.
//  Copyright © 2015 Mateusz Małek. All rights reserved.
//

import Foundation
import ObjectMapper
import MOAspects

public typealias ConfigurationObjectAction = ((String) -> Void)

enum ConfigurationObjectError : ErrorType {
    case EmptyKey, ValueNotFoundForKey, CannotMap, EmptyConfigurationCells, NotExisitingClassName, NotExistingSelectorName, NotExistingLabelName
}

class ConfigurationObject {
    
    private var configurationCells: [ConfigurationCell]?
    
    let name: String
    
    init(withDictionary configurationsDictionary:NSDictionary, forKey key:String) throws {
        self.name = key
        guard key != ""
            else { throw ConfigurationObjectError.EmptyKey }
        
        guard let value = configurationsDictionary[key]
            else { throw ConfigurationObjectError.ValueNotFoundForKey }
        
        guard let configurationCells = Mapper<ConfigurationCell>().mapArray(value)
            else { throw ConfigurationObjectError.CannotMap }
        
        self.configurationCells = configurationCells
    }
    
    func setAction(action:ConfigurationObjectAction) throws {
        guard let configurationCells = configurationCells else {
            throw ConfigurationObjectError.EmptyConfigurationCells
        }
        
        for configurationCell in configurationCells {
            
            guard let configurationClassName = configurationCell.configurationClass, let classObject = NSObject.swiftClassFromString(configurationClassName) else {
                throw ConfigurationObjectError.NotExisitingClassName
            }
            guard let configurationSelectorName = configurationCell.configurationSelector else {
                throw ConfigurationObjectError.NotExistingSelectorName
            }
            guard let configurationLabelName = configurationCell.configurationLabel else {
                throw ConfigurationObjectError.NotExistingLabelName
            }
            
            MOAspects.hookInstanceMethodForClass(classObject, selector: Selector(configurationSelectorName), position: MOAspectsPosition.After) { () -> Void in
                action(configurationLabelName)
            }
        }
    }
}