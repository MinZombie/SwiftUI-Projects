//
//  Home.swift
//  Project01
//
//  Created by meister on 2021/02/18.
//

import SwiftUI
import SDWebImageSwiftUI

struct Home: View {
    @StateObject var data = ImageViewModel()
    var columns: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(data.images, id: \.id) { image in
                    WebImage(url: URL(string: image.urls.thumb))
                        .resizable()
                        .aspectRatio(1/1, contentMode: .fit)
                        .cornerRadius(16)
                        .shadow(color: Color.black.opacity(0.35), radius: 2, x: 4, y: 4)
                }
            }
            .padding(.horizontal, 8)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
