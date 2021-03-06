//
//  Array+Extensions.swift
//  AppmazoFoundation
//
//  Created by James Hickman on 7/27/18.
//

import Foundation

public extension Array
{
    mutating func removeObject<U: Equatable>(_ object: U) {
        var index: Int?
        for (idx, objectToCompare) in self.enumerated() {
            if let to = objectToCompare as? U {
                if object == to {
                    index = idx
                }
            }
        }
        
        if(index != nil) {
            self.remove(at: index!)
        }
    }
}
