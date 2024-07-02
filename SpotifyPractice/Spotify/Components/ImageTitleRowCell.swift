//
//  ImageTitleRowCell.swift
//  SpotifyPractice
//
//  Created by Anup Ghosh on 28/06/24.
//

import SwiftUI

struct ImageTitleRowCell: View {
    var imageSize :CGFloat = 100
    var imageName : String = Constants.randomImage
    var title :String = "Some item name"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
           ImageLoaderView(urlString: imageName)
                .frame(width: imageSize, height: imageSize)
            
            Text(title)
                .font(.callout)
                .foregroundStyle(.spotifyLightGray)
                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                .padding(4)
        }
        .frame(width: imageSize)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        ImageTitleRowCell()
    }
}
