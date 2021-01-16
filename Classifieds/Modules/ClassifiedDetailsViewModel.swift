//
//  ClassifiedDetailsViewModel.swift
//  Classifieds
//
//  Created by Sateesh on 15/01/2021.
//

import Foundation

@objc class ClassifiedDetailsViewModel: NSObject {
    
    @objc var classifiedName: String
    @objc var createdDate: String
    @objc var price: String
    @objc var imageUrl: String?

    private let classified: Classified
        
    
    init(withClassified item: Classified) {
        self.classified = item
        
        let cDate = classified.createdDate?.toString(format: DateFormattes.dd_MM_yyyy_hmma)

        self.classifiedName = classified.name ?? ""
        self.createdDate = cDate ?? ""
        self.price = classified.price ?? ""
        self.imageUrl = classified.images?[0].imageUrl

    }
}


//protocol ClassifiedDetailsViewModel {
//    var classifiedName: String { get }
//    var createdDate: String { get }
//    var price: String { get }
//    var imageUrl: String? { get }
//}
