//
//  File.swift
//  
//
//  Created by Felipe Passos on 22/02/24.
//

import Foundation

class RouterManager: ObservableObject {
    static var shared = RouterManager()
    
    @Published var popUp: Popup = Popup(text: "") { }
    
    @Published var isPopUpPresented: Bool = false
    
    func showPopUp(_ popUp: Popup) {
        self.popUp = popUp
        isPopUpPresented = true
    }
    
    func hidePopUp() {
        isPopUpPresented = false
    }
}
