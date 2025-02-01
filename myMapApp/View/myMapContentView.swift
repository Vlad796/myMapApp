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
        }
    }
}

#Preview {
    myMapContentView()
        .environmentObject(locationViewModel())
}
