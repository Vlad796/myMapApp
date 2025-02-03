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
    
    @Published var sheetLocation: locationsModel? = nil
    
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
    
    func showNexLocation(location: locationsModel) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showlistCity = false
        }
    }
    
    func nextButtonPresed() {
        //вычисляем где сейчас находимся
        guard let currentIndex = locationView.firstIndex(where: { $0 == mapLocation}) else {
            print("Что то не так!")
            return
        }
        //Добавляем + 1 к нынешнему id
        let nextIndex = currentIndex + 1
        
        //Перезапускаем вычисление, и пускаем массив заново, если мы наодимся на последнем id массива 
        guard locationView.indices.contains(nextIndex) else {
            guard let firstIndex = locationView.first else {return}
            showNexLocation(location: firstIndex)
            return
        }
        let nextLocatin = locationView[nextIndex]
        showNexLocation(location: nextLocatin)
    }
}
