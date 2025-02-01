//
//  myMapCityList.swift
//  myMapApp
//
//  Created by Влад Варламов on 01.02.2025.
//

import SwiftUI

struct myMapCityList: View {
    
    @EnvironmentObject private var vm: locationViewModel
    
    var body: some View {
        List {
            ForEach(vm.locationView) { location in
                cityList(location: location)
                    .background(Color.clear )
            }
        }
        .listStyle(PlainListStyle())
    }
}

#Preview {
    myMapCityList()
        .environmentObject(locationViewModel())
}

extension myMapCityList {
    
    private func cityList(location: locationsModel) -> some View {
        HStack{
            if let imageName = location.imageNames.first{
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            HStack{
                Text("\(location.cityName): ")
                    .font(.headline)
                    .foregroundStyle(.primary)
                Text(location.name)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
}
