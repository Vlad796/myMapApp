//
//  myMapAppApp.swift
//  myMapApp
//
//  Created by Влад Варламов on 30.01.2025.
//

import SwiftUI

@main
struct myMapAppApp: App {
    
    @StateObject private var vm = locationViewModel()
    
    var body: some Scene {
        WindowGroup {
            myMapContentView()
                .environmentObject(vm)
        }
    }
}
