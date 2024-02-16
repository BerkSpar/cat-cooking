//
//  File.swift
//  
//
//  Created by Felipe Passos on 14/02/24.
//

import Foundation

extension Array {
    func get(_ index: Int) -> Any? {
        if 0 <= index && index < count {
            return self[index]
        } else {
            return nil
        }
    }
}
