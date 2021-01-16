//
//  AppTheme.swift
//  Smart Office - Digital X
//
//  Created by Abdurahman on 10/12/2020.
//

import UIKit



class AppTheme {
    class func apply() {

        let bgColor = ColorCodes.primary.color
        UINavigationBar.appearance().backgroundColor = bgColor
        UINavigationBar.appearance().barTintColor = bgColor
        UINavigationBar.appearance().tintColor = .white
 
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}
