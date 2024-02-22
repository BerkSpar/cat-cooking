//
//  File.swift
//  
//
//  Created by Felipe Passos on 14/02/24.
//

import Foundation

protocol GameLevel {
    var cats: [Cat] { get }
    
    var enableChocolate: Bool { get }
    var enableReturnToStart: Bool { get }
    var enableIfCondition: Bool { get }
    
    var phrasesPre: [String] { get }
    var phrasesPos: [String] { get }
}
