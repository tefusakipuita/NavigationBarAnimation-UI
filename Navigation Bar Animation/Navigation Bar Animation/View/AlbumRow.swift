//
//  AlbumRow.swift
//  Navigation Bar Animation
//
//  Created by 中筋淳朗 on 2020/11/19.
//

import SwiftUI

struct AlbumRow: View {
    
    // MARK: - Property
    
    var album: Album
    
    
    // MARK: - Body
    
    var body: some View {
        HStack (spacing: 15) {
            Image(album.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 55, height: 55)
                .cornerRadius(15)
            
            Text(album.title)
            
            Spacer()
        } //: HStack
        .padding(.horizontal)
    }
}

// MARK: - Preview

struct AlbumRow_Previews: PreviewProvider {
    static var previews: some View {
        AlbumRow(album: Data.albumData[6])
    }
}
