//
//  Albom.swift
//  TestTask
//
//  Created by MEV on 11.04.24.
//

import SwiftUI

final class Albom: ObservableObject {
    @Published var photos: [Photo] = []
}

struct Photo : Identifiable {
    let id: Int = UUID().hashValue
    let date: Date = Date()
    var imageName: String
    var image: UIImage
}
