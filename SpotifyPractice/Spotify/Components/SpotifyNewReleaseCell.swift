//
//  SpotifyNewReleaseCell.swift
//  SpotifyPractice
//
//  Created by Anup Ghosh on 28/06/24.
//

import SwiftUI

struct SpotifyNewReleaseCell: View {
    var imageName : String = Constants.randomImage
    var headline : String? = "New release from"
    var subheadline : String? = "Some Artist"
    var title : String? = "Some Playlist"
    var subtitle : String? = "Single - title"
    var onAddToPlayListPressed :(() -> Void)? = nil
    var  OnPlayPressed :(() -> Void)? = nil
    var body: some View {
        VStack(spacing:16) {
            HStack {
                ImageLoaderView(urlString: imageName)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                VStack(alignment: .leading,spacing: 2) {
                    if let headline {
                        Text(headline)
                            .foregroundStyle(.spotifyLightGray)
                            .font(.callout)
                    }
                    if let subheadline {
                        Text(subheadline)
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundStyle(.spotifyWhite)
                    }
                }
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            
            HStack {
                ImageLoaderView(urlString: imageName)
                    .frame(width: 140,height: 140)
                
               VStack(alignment: .leading,spacing: 25) {
                    VStack(alignment: .leading,spacing: 2) {
                        if let title {
                            Text(title)
                                .fontWeight(.semibold)
                                .foregroundStyle(.spotifyWhite)
                                .lineLimit(1)
                        }
                        
                        if let subtitle {
                            Text(subtitle)
                                .foregroundStyle(.spotifyLightGray)
                                .lineLimit(2)
                        }
                    }
                    .font(.callout)
                    
                   HStack(spacing:0) {
                        Image(systemName: "plus.circle")
                            .foregroundColor(.spotifyLightGray)
                            .font(.title3)
                            .padding(4)
                            .onTapGesture {
                                onAddToPlayListPressed?()
                            }
                            .offset(x:-4)
                            .frame(maxWidth: .infinity,alignment: .leading)

                        Image(systemName: "play.circle.fill")
                            .foregroundColor(.spotifyWhite)
                            .font(.title)
                           
                    }
                }
               .padding(.trailing,16)
            }
            .themeColors(isSelected: false)
            .cornerRadius(8)
            .onTapGesture {
                OnPlayPressed?()
            }
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        SpotifyNewReleaseCell()
            .padding()

    }
}

