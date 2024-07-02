//
//  ContentView.swift
//  SpotifyPractice
//
//  Created by Anup Ghosh on 28/06/24.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct ContentView: View {
   
    @Environment(\.router) var router
    var body: some View {
         SpotifyHomeView()
    }
}

#Preview {
    RouterView { _ in
        ContentView()
    }
}
