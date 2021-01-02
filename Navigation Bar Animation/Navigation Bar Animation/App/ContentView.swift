//
//  ContentView.swift
//  Navigation Bar Animation
//
//  Created by 中筋淳朗 on 2020/11/19.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Property
    
    var screenWidth = UIScreen.main.bounds.width
    
    @State var navOpacity: Double = 0
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack (alignment: Alignment(horizontal: .center, vertical: .top)) {
            
            // MARK: - Main
            ScrollView (showsIndicators: false) {
                VStack {
                    
                    // MARK: - Header
                    GeometryReader(content: { geometry in
                        let minY = geometry.frame(in: .global).minY
                        
                        Image("p9")
                            .resizable()
                            .scaledToFill()
                            .frame(width: screenWidth, height: 620 + minY)
                            .clipped()
                            .offset(y: -(minY + 140))
                            // minY (of以降の値) が変更された場合に呼ばれる
                            .onChange(of: minY) { _ in
                                if minY <= 0 {
                                    navOpacity = Double(-(minY + 350) / 100)
                                }
                            }
                    })
                    .frame(height: 480)
                    
                    // MARK: - List
                    VStack {
                        ForEach(Data.albumData) { album in
                            AlbumRow(album: album)
                        } //: ForEach
                    } //: VStack
                    .padding(.vertical)
                    .background(Color.white)
                    
                } //: VStack
            } //: Scroll
            
            // MARK: - Top Bar
            HStack {
                Button(action: {}, label: {
                    HStack {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 22, weight: .bold))
                        
                        Text("Search")
                            .font(.system(size: 22, weight: .regular))
                    } //: HStack
                }) //: Button
                
                Spacer()
                
                Button(action: {}, label: {
                    Image("menu")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 26, height: 26)
                        .rotationEffect(Angle(degrees: 90))
                })
            
            } //: HStack
            .foregroundColor(Color(white: (1 - navOpacity)))
            .padding(.horizontal)
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            .padding(.vertical)
            .background(
                Color.white
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 6)
                    .opacity(navOpacity)
            )
        } //: ZStack
        .ignoresSafeArea()
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
