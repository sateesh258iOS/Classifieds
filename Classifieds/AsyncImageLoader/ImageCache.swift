//
//  ImageCache.swift
//  Classifieds
//
//  Created by Sateesh on 16/01/2021.
//

import Foundation
import UIKit

protocol ImageCache: class {
    func image(for key: String) -> UIImage?
    func insertImage(_ image: UIImage?, for key: String)
    func removeImage(for key: String)
    func removeAllImages()
    subscript(_ key: String) -> UIImage? { get set }
}
