//
//  Photos2025App.swift
//  Photos2025
//
//  Created by IMD 224 on 2025-02-26.
//

import SwiftUI
import SwiftData

@main
struct Photos2025App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Photo.self)
    }
}
