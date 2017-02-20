//
//  UIColor+Extension.swift
//  GoodocKit
//
//  Created by Woody on 2017. 2. 20..
//  Copyright © 2017년 Goodoc. All rights reserved.
//

import UIKit

extension UIColor {
    
    public convenience init(hex3: UInt16, alpha: CGFloat = 1) {
        let divisor = CGFloat(15)
        let red     = CGFloat((hex3 & 0xF00) >> 8) / divisor
        let green   = CGFloat((hex3 & 0x0F0) >> 4) / divisor
        let blue    = CGFloat( hex3 & 0x00F      ) / divisor
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    public convenience init(hex4: UInt16) {
        let divisor = CGFloat(15)
        let red     = CGFloat((hex4 & 0xF000) >> 12) / divisor
        let green   = CGFloat((hex4 & 0x0F00) >>  8) / divisor
        let blue    = CGFloat((hex4 & 0x00F0) >>  4) / divisor
        let alpha   = CGFloat( hex4 & 0x000F       ) / divisor
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    public convenience init(hex6: UInt32, alpha: CGFloat = 1) {
        let divisor = CGFloat(255)
        let red     = CGFloat((hex6 & 0xFF0000) >> 16) / divisor
        let green   = CGFloat((hex6 & 0x00FF00) >>  8) / divisor
        let blue    = CGFloat( hex6 & 0x0000FF       ) / divisor
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    public convenience init(hex8: UInt32) {
        let divisor = CGFloat(255)
        let red     = CGFloat((hex8 & 0xFF000000) >> 24) / divisor
        let green   = CGFloat((hex8 & 0x00FF0000) >> 16) / divisor
        let blue    = CGFloat((hex8 & 0x0000FF00) >>  8) / divisor
        let alpha   = CGFloat( hex8 & 0x000000FF       ) / divisor
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    public convenience init?(hex: String, alpha: CGFloat = 1, defaultHex: String = "FFFFFF") {
        
        let hexString: String
        var hexValue:  UInt32 = 0
        
        if hex.hasPrefix("#") {
            hexString = hex.substring(from: hex.characters.index(hex.startIndex, offsetBy: 1))
        }
        else {
            hexString = hex;
        }
        
        if Scanner(string: hexString).scanHexInt32(&hexValue) {
            switch (hexString.characters.count) {
            case 3:
                self.init(hex3: UInt16(hexValue))
            case 4:
                self.init(hex4: UInt16(hexValue))
            case 6:
                self.init(hex6: hexValue, alpha:alpha)
            case 8:
                self.init(hex8: hexValue)
            default:
                self.init(hex: defaultHex, alpha: alpha)
            }
        }
        else {
            self.init(hex: defaultHex, alpha: alpha)
        }
    }
}
