//
//  ContentView.swift
//  StreamingStoreApp
//
//  Created by Abdiel Soto on 07/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Welcome to Gaming Store")
                .font(Font.custom("Poppins-Medium", size: 25))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
