//
//  myMapUserMarkets.swift
//  myMapApp
//
//  Created by Влад Варламов on 03.02.2025.
//

import SwiftUI

struct myMapUserMarkets: View {
    
    let accentColor = Color("AccentColor")
    
    var body: some View {
        VStack{
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .foregroundStyle(.white)
                .padding(5)
                .background(accentColor)
                .clipShape(Circle())
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 15, height: 15)
                .foregroundStyle(accentColor)
                .rotationEffect(.degrees(180))
                .offset(y: -14)
        }
        .padding(.bottom, 35)
    }
}

#Preview {
    myMapUserMarkets()
}
