//
//  ContentView.swift
//  TestTask
//
//  Created by MEV on 11.04.24.
//

import SwiftUI
import QGrid
import PhotosUI

struct MainView: View {
    
    @State private var showCamera = false
    @State private var collectionStyle: CollectionStyle = .twoColumns
    
    @EnvironmentObject var albom: Albom
    
    var body: some View {
        NavigationStack {
            QGrid(albom.photos, columns: collectionStyle.rawValue) {
                PhotoCell(photo: $0)
            }
            .navigationTitle(Text("Main"))
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("", systemImage: "photo") {
                        self.showCamera.toggle()
                    }
                    .fullScreenCover(isPresented: self.$showCamera) {
                        AccessCameraView()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Style") {
                        collectionStyle = collectionStyle == .oneColumns ? .twoColumns : .oneColumns
                    }
                }
            }
        }
    }
}

#Preview {
    MainView()
}
