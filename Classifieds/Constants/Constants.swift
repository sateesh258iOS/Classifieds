//
//  Constants.swift
//  StorageAndUtility
//
//  Created by Abdurahman on 29/12/2020.
//

import UIKit

enum StoryboardName: String {
    case main = "Main"
}

enum ColorCodes: String {
    case primary = "Primary Color"
    public var color: UIColor? {
        return UIColor(named: self.rawValue)
    }
}

struct DateFormattes {
    static let yyyy_MM_dd_HHmmss = "yyyy-MM-dd HH:mm:ss.SSS"
    static let dd_MM_yyyy_hmma = "dd/MM/yyyy h:mm a"

}
