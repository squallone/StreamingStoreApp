//
//  SButton.swift
//  StreamingStoreApp
//
//  Created by Abdiel Soto on 07/11/24.
//

import SwiftUI

struct SButton: View {
    
    let text: String
    let color: Color
    let textColor: Color
    
    var body: some View {
        Button {
            
        } label: {
            Text(text)
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(RoundedButton(color: color, textColor: textColor))
        .padding()
    }
}


struct RoundedButton: ButtonStyle {
    let color: Color
    let textColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
           configuration.label
               .padding()
               .foregroundStyle(textColor)
               .background(color)
               .foregroundStyle(.white)
               .clipShape(Capsule())
               .scaleEffect(configuration.isPressed ? 1.05 : 1)
               .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
        
       }
}

#Preview {
    SButton(
        text: "Getting Started",
        color: CustomColor.yellow,
        textColor: .primary
    )
}
