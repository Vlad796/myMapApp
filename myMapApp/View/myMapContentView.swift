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
             
            mapView
            
            VStack {
                header
                .padding()
                
                Spacer()
                
                allLocation
            }
        }
        .sheet(item: $vm.sheetLocation, onDismiss: nil) { location in
            myMapDetailSheet(location: location)
        }
    }
}

#Preview {
    myMapContentView()
        .environmentObject(locationViewModel())
}

extension myMapContentView {
    
    private var mapView: some View {
        Map(position: $vm.mapRegion) {
            ForEach(vm.locationView) { location in
                Annotation("", coordinate: location.coordinates) {
                    myMapUserMarkets()
                        .scaleEffect(vm.mapLocation == location ? 1 : 0.7)
                        .onTapGesture {
                            vm.showNexLocation(location: location)
                        }
                }
            }
        }
    }
    
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
                    .padding(.leading, 20)
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
        .background( RoundedRectangle(cornerRadius: 10)
            .fill(.ultraThinMaterial))
        .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 5)
    }
    
    private var allLocation: some View {
        ZStack{
            ForEach(vm.locationView) { location in
                if vm.mapLocation == location {
                    myMapUnderCard(location: location)
                        .shadow(color: .black.opacity(0.3), radius: 5)
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading )))
                }
            }
        }
    }
}
