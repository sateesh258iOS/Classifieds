//
//  AppUrls.swift
//  Classifieds
//
//  Created by Sateesh on 15/01/2021.
//

import Foundation

struct AppUrl {
    
    private  static let Domain = Domains.Prod
    private  static let BaseURL = Domain
    
    private struct Domains {
        static let Prod = "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com/"
        static let Dev = "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com/"
    }
    
    static let classifiedsList = BaseURL + "default/dynamodb-writer"
}
