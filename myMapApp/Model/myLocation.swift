//
//  myLocation.swift
//  myMapApp
//
//  Created by Влад Варламов on 30.01.2025.
//

import Foundation
import MapKit
import _MapKit_SwiftUI

struct locationsModel: Identifiable, Equatable {
    
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    //Тут мы делаем id по названию достопримечательности и названия города
    var id: String {
        name + cityName
    }
    
    static func == (lhs: locationsModel, rhs: locationsModel) -> Bool {
         lhs.id == rhs.id
    }
    
}


