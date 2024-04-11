//
//  DetailView.swift
//  TestTask
//
//  Created by MEV on 11.04.24.
//

import SwiftUI

struct DetailView: View {
    
    @State private var presentAlert = false
    @State private var photoName: String = ""
    
    let photo: Photo
    @EnvironmentObject var albom: Albom
    
    var body: some View {
        ZoomableScrollView {
            Image(uiImage: photo.image)
                .resizable()
                .scaledToFit()
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Button(photo.imageName) {
                            presentAlert = true
                        }
                    }
                }
                .alert("The name of the photo", isPresented: $presentAlert, actions: {
                    TextField("Name", text: $photoName)
                    Button("Save", action: {
                        if let index = albom.photos.firstIndex(where: { $0.id == photo.id}) {
                            albom.photos[index].imageName = photoName
                        }
                    })
                    Button("Cancel", role: .cancel, action: {})
                }, message: {
                    Text("Please enter a new name")
                })
        }
    }
}
