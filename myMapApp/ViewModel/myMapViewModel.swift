//
//  myMapViewModel.swift
//  myMapApp
//
//  Created by Влад Варламов on 31.01.2025.
//

import SwiftUI
import Foundation
import MapKit
import _MapKit_SwiftUI

//mapLocation и mapRegion две разные переменные, которые нам нужно обновлять
//когда обновиться mapLocation, автоматически обновиться mapRegion

//Этот класс прописывается для ViewModel
class locationViewModel: ObservableObject {
    @Published var locationView: [locationsModel] //Создается публичная переменная (Как всегда для класса) которая имеет тип массива локаций
    
    @Published var mapLocation: locationsModel {
        didSet {
            //Каждый раз, когда мы задаем значение для mapLocation, вызывается обновление области карты(updateMapRegion) и передается текушее место положение (mapLocation)
            updateMapRegion(location: mapLocation)
        }
    }
    
    @Published var mapRegion: MapCameraPosition = MapCameraPosition.region(MKCoordinateRegion())
    
    @Published var showlistCity: Bool = false
    
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init() {
        let locationInit = LocationsDataService.locations
        self.locationView = locationInit
        self.mapLocation = locationInit[0]
        self.updateMapRegion(location: locationInit[0] )
    }
    
    private func updateMapRegion (location: locationsModel) {
        withAnimation(.easeIn) {
            mapRegion = MapCameraPosition.region(MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan))
        }
        
    }
    
    func toggleListCity() {
        withAnimation(.easeInOut) {
            showlistCity.toggle()
        }
    }
}
