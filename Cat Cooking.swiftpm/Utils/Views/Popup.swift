//
//  Popup.swift
//  
//
//  Created by Felipe Passos on 22/02/24.
//

import SwiftUI

struct Popup: View {
    var text: String
    var isHappy: Bool = true
    var onTap: () -> Void
    
    @State private var degrees = 5.0
    @State private var opacity = 1.0
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
                .opacity(0.5)
            
            VStack {
                Image(isHappy ? "Tommas" : "BadTommas")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .padding(.bottom, 16)
                    .rotationEffect(Angle(degrees: degrees))
                    .onAppear {
                        withAnimation(.easeInOut(duration: 0.5).repeatForever(autoreverses: true)) {
                            degrees = -5
                        }
                    }
                
                Text(text)
                    .multilineTextAlignment(.center)
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .padding(32)
                    .background(Color("LightBlue"))
                    
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color("DarkBlue"), lineWidth: 5))
                    .padding(.bottom, 16)
                
                Text("Tap anywhere to continue")
                    .font(.title)
                    .foregroundStyle(.white)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                            opacity = 0.2
                        }
                    }
            }
            .padding(.horizontal, 128)
        }
        .onTapGesture {
            RouterManager.shared.hidePopUp()
            
            onTap()
        }
    }
}

#Preview {
    Popup(text: "Ihu") { }
}
