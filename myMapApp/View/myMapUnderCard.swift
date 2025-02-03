//
//  myMapUnderCard.swift
//  myMapApp
//
//  Created by Влад Варламов on 02.02.2025.
//

import SwiftUI

struct myMapUnderCard: View {
    
    @EnvironmentObject private var vm: locationViewModel
    let location: locationsModel
    
    var body: some View {
        HStack(alignment: .bottom){
            VStack(alignment: .leading){
                imageSection
                
                titleSection
                    .padding(.top, 15)
            }
            Spacer()
            VStack(spacing: 8) {
                toLernMoreButton
                nextButton
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y: 50)
        )
        .clipShape(RoundedRectangle(cornerRadius: 10 ))
        .padding()
        
    }
}

#Preview {
    myMapUnderCard(location: LocationsDataService.locations.first! )
        .environmentObject(locationViewModel())
}


extension myMapUnderCard {
    
    private var imageSection: some View {
        ZStack {
            if let imageNames = location.imageNames.first {
                Image(imageNames)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 10)
            }
        }
        
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 7) {
            Text(location.cityName)
                .font(.headline)
                .foregroundStyle(.primary)
            Text(location.name)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
    
    private var toLernMoreButton: some View {
        
        Button {
            vm.sheetLocation = location 
        } label: {
            Text("Узнать больше")
                .font(.headline)
                .frame(width: 125, height: 30)
        }
        .buttonStyle(.borderedProminent)
        
            
        
    }
    
    private var nextButton: some View {
        Button {
            vm.nextButtonPresed()
        } label: {
            Text("Cледующее")
                .font(.headline)
                .frame(width: 125, height: 30)
        }
        .buttonStyle(.bordered)
    }
}
