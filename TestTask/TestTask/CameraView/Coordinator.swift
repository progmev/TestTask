//
//  Coordinator.swift
//  TestTask
//
//  Created by MEV on 11.04.24.
//

import SwiftUI

class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var picker: AccessCameraView
    
    init(picker: AccessCameraView) {
        self.picker = picker
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        self.picker.albom.photos.append(Photo(imageName: "\(Date().formatted()) (\(self.picker.albom.photos.count))",
                                               image: selectedImage))
        self.picker.isPresented.wrappedValue.dismiss()
    }
}
