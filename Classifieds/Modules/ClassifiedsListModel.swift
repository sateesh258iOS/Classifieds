//
//  ClassifiedsListModel.swift
//  Classifieds
//
//  Created by Sateesh on 15/01/2021.
//

import Foundation

class ClassifiedsListModel: Parsable {

    let results: [Classified]?
}

struct ClassifiedImage {

    let uid:String?
    let imageUrl:String?
    let thumbnailUrl:String?
}

struct Classified: Parsable {

    let createdDate:Date?
    let price:String?
    let name:String?
    let uid:String?
    var images:[ClassifiedImage]?
    
    enum CodingKeys: String, CodingKey {
        case created_at
        case price
        case name
        case uid
        case image_ids
        case image_urls
        case image_urls_thumbnails
    }
    
    init(from decoder: Decoder) throws {

        let values = try decoder.container(keyedBy: CodingKeys.self)
        let imageUrls = try values.decode([String].self, forKey: .image_urls)
        let thumbnailUrls = try values.decode([String].self, forKey: .image_urls_thumbnails)
        let imageIds = try values.decode([String].self, forKey: .image_ids)
        
        /// Formate date
        let dateS =  try values.decode(String.self, forKey: .created_at)
        let date = dateS.toDate(format: DateFormattes.yyyy_MM_dd_HHmmss)
        self.createdDate = date
        /// Images
        
        self.images = imageIds.enumerated().map {ClassifiedImage(uid: $1, imageUrl: imageUrls[$0], thumbnailUrl: thumbnailUrls[$0]) }
        ///
        self.price = try values.decode(String.self, forKey: .price)
        self.name = try values.decode(String.self, forKey: .name)
        self.uid = try values.decode(String.self, forKey: .uid)

    }
    
    func encode(to encoder: Encoder){

    }
}

