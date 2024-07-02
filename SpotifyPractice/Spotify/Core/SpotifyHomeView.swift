//
//  SpotifyHomeView.swift
//  SpotifyPractice
//
//  Created by Anup Ghosh on 28/06/24.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting


struct SpotifyHomeView: View {
    @Environment(\.router) var router

    
    @State private var currentUser : User? = nil
    @State private var selectedCategory : Category? = .all
    @State private var products : [Product] = []
    @State private var productRows : [ProductRow] = []
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            ScrollView(.vertical) {
                LazyVStack(spacing: 1,
                           pinnedViews: [.sectionHeaders],
                           content: {
                    Section {
                        VStack {
                            recentSection
                                .padding(.horizontal,16)
                            
                            if let product = products.first {
                                newReleaseSection(product: product)
                                    .padding(.horizontal,16)
                            }
                            
                            listRows
                            
                        }

                       
                    } header: {
                        header
                    }
                })
                .padding(.top, 8)
            }
            .scrollIndicators(.hidden)
            .clipped()
        }
        .task {
            await getData()
        }
        .toolbar(.hidden,for: .navigationBar)
    }
    
    private func getData() async {
        do {
            currentUser = try await DatabaseHelper().getUsers().first
            products = try await Array(DatabaseHelper().getProducts().prefix(8))
            
            var rows : [ProductRow] = []
            let allBrands = Set(products.map({$0.brand}))
            for brand in allBrands {
//                let products = self.products.filter({$0.brand == brand})
                rows.append(ProductRow(title: brand?.capitalized ?? "", products: products))
            }
            productRows = rows
        } catch {
            
        }
    }
    private var header : some View {
        HStack(spacing:0) {
            
            ZStack {
                if let currentUser {
                    ImageLoaderView()
                        .frame(width: 30,height: 30)
                        .background(.spotifyWhite)
                        .clipShape(Circle())
                        .onTapGesture {
                            router.dismissScreen()
                        }
                }
            }
            .frame(width: 35,height: 35)
            
            ScrollView(.horizontal) {
                HStack(spacing:8) {
                    ForEach(Category.allCases, id:  \.self) { category in
                        SpotifyCategoryCell(
                            title: category.rawValue.capitalized,
                            isSelected: category == selectedCategory
                        )
                        .onTapGesture {
                            selectedCategory = category
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
            .scrollIndicators(.hidden)
        }
        .padding(.vertical,24)
        .padding(.leading, 8)
        .frame(maxWidth: .infinity)
        .background(Color.spotifyBlack)
    }
    
    private var recentSection : some View {
        NonLazyVGrid(columns: 2, alignment: .center, spacing: 10, items: products) { 
            product in
            if let product {
                SpotifyRecentCells(
                    imageName: product.firstImage,
                    title: product.title
                )
                .asButton(.press) {
                    goToPlayListView(product: product)
                }
            }
        }
    }
    
    private func goToPlayListView(product :Product) {
        
        guard let currentUser else { return }
        router.showScreen(.push){ _ in
            SpotifyPlaylistView(product: product,user: currentUser)
        }
    }
    private func newReleaseSection(product:Product) -> some View {
        SpotifyNewReleaseCell(
            imageName: product.firstImage,
            headline: product.brand,
            subheadline: product.category,
            title: product.title,
            subtitle: product.description,
            onAddToPlayListPressed: {
                
            },
            OnPlayPressed: {
                goToPlayListView(product: product)
            }
        )
    }
    
    private var listRows : some View {
        ForEach(productRows) { row in
            VStack(spacing:8) {
                Text(row.title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.spotifyWhite)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .padding(.horizontal,16)

                ScrollView(.horizontal) {
                    HStack(alignment:.top,spacing : 16) {
                        ForEach(row.products) { product in
                            ImageTitleRowCell(
                                imageSize: 120,
                                imageName: product.firstImage,
                                title: product.title
                            )
                            .asButton(.press) {
                                goToPlayListView(product: product)
                            }
                        }
                    }
                }
                .scrollIndicators(.hidden)
                
            }
        }
    }
}

#Preview {
    RouterView { _ in
        SpotifyHomeView()

    }
}
