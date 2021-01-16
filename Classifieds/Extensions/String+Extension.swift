//
//  String+Extension.swift
//  Classifieds
//
//  Created by Sateesh on 15/01/2021.
//


import Foundation

public extension String {

    func toDate(format: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter.date(from: self)
    }
}
