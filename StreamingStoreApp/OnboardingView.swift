//
//  OnboardingView.swift
//  StreamingStoreApp
//
//  Created by Abdiel Soto on 07/11/24.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        VStack(spacing: 4) {
            Spacer()
            Text("Welcome to Gaming Store")
                .poppinsFont(.medium, size: 24)
                .foregroundStyle(.white)
                .padding(.vertical, 6)
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore")
                .poppinsFont(.regular, size: 14)
                .multilineTextAlignment(.center)
                .foregroundStyle(.white)
                .padding(.vertical)
                .padding(.horizontal, 20)
            
            SButton(text: "Getting Started", color: CustomColor.yellow, textColor: .primary)
        }
        .background {
            if let url = Bundle.main.url(forResource: "onboarding_video", withExtension: "mp4") {
                LiveComponent(url: url)
            }
        }
        .padding(6)
        .ignoresSafeArea(.all)
    }
}

#Preview {
    OnboardingView()
}
