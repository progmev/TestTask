//
//  PhotoCell.swift
//  TestTask
//
//  Created by MEV on 11.04.24.
//

import SwiftUI
struct PhotoCell: View {
    
    let photo: Photo
    
    @State private var moveToDetailScreen = false
    
    @EnvironmentObject var albom: Albom
    
    var body: some View {
        VStack() {
            Image(uiImage: photo.image)
                .resizable()
                .scaledToFit()
            Text(photo.imageName)
        }
        .navigationDestination(isPresented: self.$moveToDetailScreen, destination: {
            DetailView(photo: photo)
        })
        .onTapGesture {
            moveToDetailScreen.toggle()
        }
        .contextMenu {
            Button {
                albom.photos.removeAll { photo in
                    photo.id == self.photo.id
                }
            } label: {
                Label("Delete", systemImage: "trash")
            }
        }
    }
}
