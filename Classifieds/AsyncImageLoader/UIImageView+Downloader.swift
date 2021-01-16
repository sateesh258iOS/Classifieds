//
//  UIImageView+Downloader.swift
//  UIImageView+Downloader
//
//  Created by Sateesh on 17/01/2021.
//

import Foundation
import UIKit


protocol AsyncLoad {
    func setImageFrom(imageURLString: String,
                      placeHolderImage: UIImage?,
                      completionHandler: DownloadHandler?)
}

typealias DownloadHandler = (_ image: UIImage?,  _ error: Error?) -> Void
typealias DownloadProgressHandler = (_ totalBytesExpected : Int64,  _ bytesDownloaded: Int64, _ error : Error?) -> Void

private var kImageKey : String = "imageKey"

@objc extension UIImageView: AsyncLoad {
    
    var imageURLId : String{
        
        get{
            return objc_getAssociatedObject(self, &kImageKey) as! String
        }
        set(newValue){
            objc_setAssociatedObject(self, &kImageKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    @objc func setImageFrom(imageURLString : String,
                      placeHolderImage: UIImage? = nil,
                      completionHandler: DownloadHandler?) {
        
        guard imageURLString.count > 0  else {
            if let handler = completionHandler {
                handler(nil, nil)
            }
            return
        }
        
        if placeHolderImage != nil {
            image = placeHolderImage;
        }
        
        imageURLId = imageURLString
        ImageDownloadManager.shared.getImageFromURL(imageURLString: imageURLString) { (image : UIImage?, error :Error?) in
            
            guard let inImage = image else {
                if let handler = completionHandler {
                    handler(nil, error)
                }
                return
            }
            
            self.updateImage(image: inImage, imageUrl: imageURLString)
            if let handler = completionHandler {
                handler(inImage, nil);
            }
        }
    }
    
    func setImageFrom(imageURLString: String,
                      placeHolderImage: UIImage? = nil,
                      progressHandler: @escaping DownloadProgressHandler,
                      completionHandler: @escaping DownloadHandler) {
        
        guard imageURLString.count > 0  else {
            completionHandler(nil, nil)
            return
        }
        
        if ((placeHolderImage) != nil){
            self.image = placeHolderImage;
        }
        self.imageURLId = imageURLString
        
        ImageDownloadManager.shared.getImageFromURL(imageURLString: imageURLString,
                                                    progessHandler: { (expectedBytes: Int64, downloadedBytes: Int64, error: Error?) in
                                                        progressHandler(expectedBytes, downloadedBytes, error)
                                                        
        }) { (image: UIImage?, error: Error?) in
            guard let inImage = image else {
                completionHandler(nil, nil)
                return
            }
            
            self.updateImage(image: inImage, imageUrl: imageURLString)
            completionHandler(inImage, error)
        }
    }

    
    private func updateImage(image:UIImage, imageUrl:String) {
        
        if (imageUrl == imageURLId){
            self.image = image;
        }
    }
}
