//
//  ImageStorageManager.swift
//  Classifieds
//
//  Created by Sateesh on 16/01/2021.
//

import Foundation
import UIKit

class ImageCacheStorageController: ImageCache {
    
    private lazy var imageCache: NSCache<AnyObject, AnyObject> = {
        let cache = NSCache<AnyObject, AnyObject>()
        return cache
    }()
    
    func image(for key: String) -> UIImage? {
        
        if let cachedImage = imageCache.object(forKey: key as NSString) as? UIImage {
            return cachedImage
        }
        return nil
    }
    
    func insertImage(_ image: UIImage?, for key: String) {
        self.imageCache.setObject(image!, forKey: key as NSString)
    }
    
    func removeImage(for key: String) {
        self.imageCache.removeObject(forKey: key as AnyObject)
    }
    
    func removeAllImages() {
        self.imageCache.removeAllObjects()
    }
    
    subscript(key: String) -> UIImage? {
        get {
            return image(for: key)
        }
        set {
            return insertImage(newValue, for: key)
        }
    }

}
