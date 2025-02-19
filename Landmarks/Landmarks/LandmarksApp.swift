//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Cuma Aktaş on 19.02.2025.
//

import SwiftUI
import SwiftData

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
        
    }
}
