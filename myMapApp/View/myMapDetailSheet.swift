//
//  myMapDetailSheet.swift
//  myMapApp
//
//  Created by Влад Варламов on 03.02.2025.
//

import SwiftUI
import MapKit

struct myMapDetailSheet: View {
    
    @EnvironmentObject private var vm: locationViewModel
    let location: locationsModel
    
    var body: some View {
        ScrollView {
            VStack {
                imageTabView
                    .shadow(color: .black.opacity(0.4), radius: 9, y: 5)
            }
            
            textSection
            Divider()
            
            descriptionLinkSection
            Divider()
            mapView
                .padding()
        }
        .frame(maxWidth: .infinity)
        .overlay(alignment: .topLeading) {
            closeButton
        }
    }
}

#Preview {
    myMapDetailSheet(location: LocationsDataService.locations.first!)
        .environmentObject(locationViewModel())
}

extension myMapDetailSheet {
    
    private var imageTabView: some View {
        TabView {
            ForEach(location.imageNames, id: \.self) { imageName in
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
            }
            
        }
        .frame(height: 300)
        .tabViewStyle(.page)
    }
    
    private var textSection: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.semibold)
            Text(location.cityName)
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
    
    private var descriptionLinkSection: some View {
        VStack{
            Text(location.description)
                .font(.body)
                .foregroundStyle(.secondary)
                .lineLimit(nil)
                .padding()
            
            if let linkWikipedia = URL(string: location.link) {
                Link("Узнать больше на Wikipedia", destination: linkWikipedia )
            }
        }
    }
    
    private var mapView: some View {
        Map(position: .constant(.region(MKCoordinateRegion(center: location.coordinates, span: vm.mapSpan)))) {
            Annotation("", coordinate: location.coordinates) {
                myMapUserMarkets()
            }
        }
        .allowsHitTesting(false)
        .aspectRatio(1 ,contentMode: .fit)
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
    
    private var closeButton: some View {
        Button {
            vm.sheetLocation = nil
        } label: {
            Image(systemName: "xmark")
                .foregroundStyle(.primary)
                .font(.title)
                .padding(6)
                .background(.thickMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding()
                .shadow(radius: 3)
        }
    }
}
