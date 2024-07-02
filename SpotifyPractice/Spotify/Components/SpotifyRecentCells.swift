//
//  SpotifyRecentCells.swift
//  SpotifyPractice
//
//  Created by Anup Ghosh on 28/06/24.
//

import SwiftUI

struct SpotifyRecentCells: View {
    
    var imageName : String = Constants.randomImage
    var title : String = "Some random title"
    var body: some View {
        HStack(spacing:16){
            ImageLoaderView(urlString: imageName)
                .frame(width: 55, height: 55)
            
            Text(title)
                .font(.callout)
                .fontWeight(.semibold)
                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
        }
        .padding(.trailing,8)
        .frame(maxWidth: .infinity,alignment: .leading)
        .themeColors(isSelected: false)
        .background(Color.blue)
        .cornerRadius(6)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        VStack {
            HStack {
                SpotifyRecentCells()
                SpotifyRecentCells()
            }
            
            HStack {
                SpotifyRecentCells()
                SpotifyRecentCells()
            }
        }
    }
}
