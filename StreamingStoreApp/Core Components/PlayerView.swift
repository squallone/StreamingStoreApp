//
//  PlayerView.swift
//  StreamingStoreApp
//
//  Created by Abdiel Soto on 07/11/24.
//

import SwiftUI
import AVKit
import Combine

struct Component<Content: View>: View {
    
    var content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Explore new worlds")
                .font(.headline)
            Text("Read more..")
                .font(.caption)
        }
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding(20)
        .background {
            content()
        }
        .frame(height: 142)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .padding(20)
    }
    
}

struct LiveComponent: View {
    
    private let queuePlayer: AVQueuePlayer
    private let playerLooper: AVPlayerLooper
    
    @StateObject private var playerStatusObserver: PlayerStatusObserver
    
    init(url: URL) {
        let playerItem = AVPlayerItem(url: url)
        self.queuePlayer = AVQueuePlayer(items: [playerItem])
        self.queuePlayer.isMuted = true
        self.playerLooper = AVPlayerLooper(player: queuePlayer, templateItem: playerItem)

        let observer = PlayerStatusObserver(player: queuePlayer)
        self._playerStatusObserver = StateObject(wrappedValue: observer)
    }
    var body: some View {
        VStack {
            switch playerStatusObserver.status {
            case .readyToPlay:
                VideoPlayer(player: queuePlayer)
                    .disabled(true)
                    .aspectRatio(contentMode: .fill)
                    .overlay {
                        Color.black.opacity(0.2)
                    }
            case .failed:
                Image("ocean")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .overlay {
                        Color.black.opacity(0.2)
                    }
            default:
                EmptyView()
            }
        }
        .task {
            self.queuePlayer.play()
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

private final class PlayerStatusObserver: ObservableObject {
    @Published var status: AVPlayerItem.Status = .unknown
    
    private var player: AVQueuePlayer
    private var statusObservation: AnyCancellable?
    
    init(player: AVQueuePlayer) {
        self.player = player
        statusObservation = player.publisher(for: \.currentItem?.status)
            .receive(on: RunLoop.main)
            .sink { [weak self] status in
                withAnimation {
                    self?.status = status ?? .failed
                }
            }
    }
}


#Preview {
    LiveComponent(url: Bundle.main.url(forResource: "onboarding_video", withExtension: "mp4")!)
}
