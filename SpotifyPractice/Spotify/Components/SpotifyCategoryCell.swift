//
//  SpotifyCategoryCell.swift
//  SpotifyPractice
//
//  Created by Anup Ghosh on 28/06/24.
//

import SwiftUI

struct SpotifyCategoryCell: View {
    
    var title :String = "Music"
    var isSelected : Bool = false
    
    var body: some View {
        Text(title)
            .font(.callout)
            .frame(minWidth: 40)
            .padding(.vertical, 8)
            .padding(.horizontal, 10)
            .themeColors(isSelected: isSelected)
            .cornerRadius(20)
    }
}

extension View {
    func themeColors(isSelected : Bool) -> some View {
        self
            .background(isSelected ? .spotifyGreen : .spotifyDarkGray)
            .foregroundStyle(isSelected ? .spotifyBlack : .spotifyWhite)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        VStack(spacing :40) {
            SpotifyCategoryCell(title: "All")
            SpotifyCategoryCell(title: "Music",isSelected: false)
            SpotifyCategoryCell(isSelected: true)
        }
    }
}
