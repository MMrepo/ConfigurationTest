//
//  ConfigurationCell.swift
//  ConfigurationTest
//
//  Created by Mateusz Małek on 03.12.2015.
//  Copyright © 2015 Mateusz Małek. All rights reserved.
//

import Foundation
import ObjectMapper

public struct ConfigurationCell:Mappable {
    
    var configurationClass:    String?
    var configurationSelector: String?
    var configurationLabel:    String?
    
    public init?(_ map: Map) {}
    
    public mutating func mapping(map: Map) {
        configurationClass    <- map["class"]
        configurationSelector <- map["selector"]
        configurationLabel    <- map["label"]
    }
}

public struct testObject:Mappable {
    
    var configurationClass:    String?
    var configurationSelector: String?
    var configurationLabel:    String?
    
    public init?(_ map: Map) {}
    
    public mutating func mapping(map: Map) {
        configurationClass    <- map["class"]
        configurationSelector <- map["selector"]
        configurationLabel    <- map["label"]
    }
}