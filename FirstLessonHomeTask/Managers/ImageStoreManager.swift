//
//  ImageStoreManager.swift
//  FirstLessonHomeTask
//
//  Created by VLADIMIR LEVTSOV on 06.12.2020.
//

import SwiftUI

final class ImageStoreManager {
    
    typealias _ImageDictionary = [String: CGImage]
    fileprivate var images: _ImageDictionary = [:]
    
    static var shared = ImageStoreManager()
    
    private init() {}
    
    func image(name: String) -> Image {
        let index = _guaranteeImage(name: name)
        
        return Image(images.values[index], scale: 1, label: Text(name))
    }

    fileprivate static func loadImage(name: String) -> CGImage {
        guard
            let url = Bundle.main.url(forResource: name, withExtension: "png"),
            let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
            let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
        else {
            fatalError("Couldn't load image \(name)")
        }
        return image
    }
    
    fileprivate func _guaranteeImage(name: String) -> _ImageDictionary.Index {
        if let index = images.index(forKey: name) { return index }
        
        images[name] = ImageStoreManager.loadImage(name: name)
        return images.index(forKey: name)!
    }
    
}
