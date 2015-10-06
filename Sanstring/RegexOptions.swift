//
//  RegexOptions.swift
//  Sanstring
//
//  Created by Fabian Canas on 12/25/14.
//  Copyright (c) 2014 Fabian Canas. All rights reserved.
//

import Foundation

private let RegexOptionsKey = "regexOptionsKey"
internal let RegexOptionsChangedKey = "RegexOptionsChanged"

internal var GlobalRegexOptions :NSRegularExpressionOptions = NSRegularExpressionOptions(rawValue: UInt(NSUserDefaults.standardUserDefaults().integerForKey(RegexOptionsKey))) {
    didSet {
        NSUserDefaults.standardUserDefaults().setInteger(Int(GlobalRegexOptions.rawValue), forKey: RegexOptionsKey)
    }
}
