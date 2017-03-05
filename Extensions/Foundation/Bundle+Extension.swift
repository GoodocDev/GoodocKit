//
//  NSBundle+Extension.swift
//  GoodocKit
//
//  Created by Woody on 2017. 3. 5..
//  Copyright © 2017년 Goodoc. All rights reserved.
//

import Foundation

extension Bundle {
    
    /**
     
     - return : 앱버전
     - author: Woody
     */
    public func appVersion() -> String {
        return infoDictionary!["CFBundleShortVersionString"] as! String
    }

    /**
     
     - return : 번들버전
     - author: Woody
     */
    public func buildVersion() -> String {
        return infoDictionary![kCFBundleVersionKey as String] as! String
    }

    /**
     - parameters:
        - version : 비교하려는 앱 버전 문자열
     - return : 현재 앱 버전이 비교하고 싶은 버전보다 높거나 같으면 false, 비교하고 싶은 버전이 높으면 true
     - author: Woody
     */
    public func isNewerThenAppVersion(version : String) -> Bool {
        return appVersion().compare(version, options: NSString.CompareOptions.numeric) == .orderedAscending
    }
}
