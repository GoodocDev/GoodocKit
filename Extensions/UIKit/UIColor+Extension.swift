//
//  UIColor+Extension.swift
//  GoodocKit
//
//  Created by Woody on 2017. 2. 20..
//  Copyright © 2017년 Goodoc. All rights reserved.
//

import UIKit

extension UIColor {
    
    /**
     3자리 16진수 hex값를 UIColor로 반환한다.
     - parameters:
        - hex3: #RGB hex값
        - alpha: 0.0 - 1.0, 기본값은 1
     - return : UIColor
     - author: Woody
     */
    public convenience init(hex3: UInt16, alpha: CGFloat = 1) {
        let divisor = CGFloat(15)
        let red     = CGFloat((hex3 & 0xF00) >> 8) / divisor
        let green   = CGFloat((hex3 & 0x0F0) >> 4) / divisor
        let blue    = CGFloat( hex3 & 0x00F      ) / divisor
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /**
     4자리 16진수 hex코드를 UIColor로 반환한다.
     - parameters:
        - hex4 #RGBA hex값
     - return : UIColor
     - author: Woody
     */
    public convenience init(hex4: UInt16) {
        let divisor = CGFloat(15)
        let red     = CGFloat((hex4 & 0xF000) >> 12) / divisor
        let green   = CGFloat((hex4 & 0x0F00) >>  8) / divisor
        let blue    = CGFloat((hex4 & 0x00F0) >>  4) / divisor
        let alpha   = CGFloat( hex4 & 0x000F       ) / divisor
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /**
     6자리 16진수 hex코드를 UIColor로 반환한다.
     - parameters:
        - hex6: #RRGGBB hex
        - alpha: 0.0 - 1.0, 기본값은 1
     - return : UIColor
     - author: Woody
     */
    public convenience init(hex6: UInt32, alpha: CGFloat = 1) {
        let divisor = CGFloat(255)
        let red     = CGFloat((hex6 & 0xFF0000) >> 16) / divisor
        let green   = CGFloat((hex6 & 0x00FF00) >>  8) / divisor
        let blue    = CGFloat( hex6 & 0x0000FF       ) / divisor
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /**
     8자리 16진수 hex코드를 UIColor로 반환한다.
     - parameters:
        - hex8: #RRGGBBAA hex
     - return : UIColor
     - author: Woody
     */
    public convenience init(hex8: UInt32) {
        let divisor = CGFloat(255)
        let red     = CGFloat((hex8 & 0xFF000000) >> 24) / divisor
        let green   = CGFloat((hex8 & 0x00FF0000) >> 16) / divisor
        let blue    = CGFloat((hex8 & 0x0000FF00) >>  8) / divisor
        let alpha   = CGFloat( hex8 & 0x000000FF       ) / divisor
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /**
     8자리 16진수 hex코드를 UIColor로 반환한다.
     - parameters:
        - hex: 문자열 형태의 hex값
        - alpha: 0.0 - 1.0, 기본값은 1
        - defaultHex : 잘못된 hex값이 들어왔을 경우 대신되는 hex값
     - return : UIColor
     - author: Woody
     */
    public convenience init(hex: String, alpha: CGFloat = 1, defaultHex: String = "FFFFFF") {
        
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

    /**
     
     - parameters:
        - r : 0.0 - 255.0
        - g : 0.0 - 255.0
        - b : 0.0 - 255.0
        - a : 0.0 - 1.0, 기본값은 1
     - return : UIColor
     - author: Woody
     */
    public convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a : CGFloat = 1) {
        self.init(red: g/CGFloat(255), green: g/CGFloat(255), blue: a/CGFloat(255), alpha: 1)
    }
    
    /**
     
     - parameters:
        - includeAlpha :
     - return : String
     - author: Woody
     */
    public func hexString(includeAlpha: Bool = false) -> String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        if (includeAlpha) {
            return String(format: "#%02X%02X%02X%02X", Int(r * 255), Int(g * 255), Int(b * 255), Int(a * 255))
        } else {
            return String(format: "#%02X%02X%02X", Int(r * 255), Int(g * 255), Int(b * 255))
        }
    }
}
