//
//  Photo.swift
//  Photos2025
//
//  Created by IMD 224 on 2025-02-26.
//
import UIKit
import Observation
import SwiftData

@Model
@Observable class Photo: Identifiable {
    private var imageAsData: Data
    var image: UIImage {
        get {
            UIImage(data: imageAsData)!
        }
        set {
            imageAsData = newValue.pngData()!
        }
    }
    var name: String
    var date: Date
    
    init(image: UIImage, name: String, date: Date) {
        self.image = image
        self.name = name
        self.date = date
    }
}
