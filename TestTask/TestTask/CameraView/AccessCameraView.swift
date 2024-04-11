//
//  AccessCameraView.swift
//  TestTask
//
//  Created by MEV on 11.04.24.
//

import SwiftUI

struct AccessCameraView: UIViewControllerRepresentable {
    
    @EnvironmentObject var albom: Albom
    @Environment(\.presentationMode) var isPresented
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(picker: self)
    }
}
