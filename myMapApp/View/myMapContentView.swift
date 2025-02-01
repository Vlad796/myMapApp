//
//  myMapContent.swift
//  myMapApp
//
//  Created by Влад Варламов on 31.01.2025.
//

import SwiftUI
import MapKit


struct myMapContentView: View {

    @EnvironmentObject private var vm: locationViewModel
    
    var body: some View {
        ZStack {
            Map(position: $vm.mapRegion)
            VStack {
                header
                .padding()
                
                
                Spacer()
            }
        }
    }
}

#Preview {
    myMapContentView()
        .environmentObject(locationViewModel())
}

extension myMapContentView {
    private var header: some View {
        VStack{
            Button {
                vm.toggleListCity()
            } label: {
                Text(vm.mapLocation.cityName + ", " + vm.mapLocation.name)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundStyle(.primary)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .overlay(alignment: .leading) {
                        Image(systemName: "chevron.down")
                            .foregroundStyle(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: vm.showlistCity ? 180 : 0))
                    }
            }
            if vm.showlistCity {
                myMapCityList()
            }
                
        }
        .background(Color.white.opacity(0.8))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 5)
    }
}
