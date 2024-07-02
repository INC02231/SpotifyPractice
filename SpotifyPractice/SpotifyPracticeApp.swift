//
//  SpotifyPracticeApp.swift
//  SpotifyPractice
//
//  Created by Anup Ghosh on 28/06/24.
//

import SwiftUI
import SwiftfulRouting
@main
struct SpotifyPracticeApp: App {
    var body: some Scene {
        WindowGroup {
            RouterView { _ in
                ContentView()
            }
        }
    }
}
