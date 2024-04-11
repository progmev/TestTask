//
//  TestTaskApp.swift
//  TestTask
//
//  Created by MEV on 11.04.24.
//

import SwiftUI

@main
struct TestTaskApp: App {
    
    @StateObject private var albom: Albom = Albom()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(albom)
        }
    }
}
