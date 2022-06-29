//
//  ImageCache.swift
//  Star Wars Legacy
//
//  Created by Omar Regalado Mendoza on 28/06/22.
//

import Foundation
import UIKit

protocol ImageCache {
    subscript(_ url: URL) -> UIImage? {get set}
}

struct TemporaryImageCache: ImageCache {
    
    private let cache = NSCache<NSURL, UIImage>()
    
    subscript(_ key: URL) -> UIImage? {
        get {
            cache.object(forKey: key as NSURL)
        }
        set {
            newValue == nil ? cache.removeObject(forKey: key as NSURL) : cache.setObject(newValue!, forKey: key as NSURL)
        }
    }
    
}
