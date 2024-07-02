//
//  SongRowCell.swift
//  SpotifyPractice
//
//  Created by Anup Ghosh on 01/07/24.
//

import SwiftUI

struct SongRowCell: View {
    
    var imageName : String = Constants.randomImage
    var imageSize :CGFloat = 50
    var title : String = "Some song name goes here"
    var subtitle : String? = "Some artist name"
    var onCallPressed :(() -> Void)? = nil
    var onEllipsisPressed :(() -> Void)? = nil
    var body: some View {
        HStack(spacing:8){
            ImageLoaderView(urlString: imageName)
                .frame(width: imageSize, height: imageSize)
            
            VStack(alignment: .leading, spacing:4) {
                Text(title)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundStyle(.spotifyWhite)
                
                if let subtitle {
                    Text(subtitle)
                        .font(.callout)
                        .foregroundStyle(.spotifyLightGray)
                }
            }
            .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
            .frame(maxWidth: .infinity,alignment: .leading)

            Image(systemName: "ellipsis")
                .font(.subheadline)
                .foregroundStyle(.spotifyWhite)
                .padding(16)
                .background(Color.black.opacity(0.001))
                .onTapGesture {
                    onEllipsisPressed?()
                }
        }
        .background(Color.black.opacity(0.001))
        .onTapGesture {
            onCallPressed?()
        }
    }
}

#Preview {
    ZStack{
        Color.spotifyBlack.ignoresSafeArea()
        VStack {
            SongRowCell()
           
        }
    }
}
