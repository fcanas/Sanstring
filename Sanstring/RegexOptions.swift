//
//  RegexOptions.swift
//  Sanstring
//
//  Created by Fabian Canas on 12/25/14.
//  Copyright (c) 2014 Fabian Canas. All rights reserved.
//

import Foundation

private var options :NSRegularExpressionOptions = NSRegularExpressionOptions(rawValue: UInt(NSUserDefaults.standardUserDefaults().integerForKey(regexOptionsKey)))
private let regexOptionsKey = "regexOptionsKey"

func globalRegexOptions() -> NSRegularExpressionOptions {
    return options
}

func setGlobalRegexOptions(opts: NSRegularExpressionOptions) {
    options = opts
    NSUserDefaults.standardUserDefaults().setInteger(Int(options.rawValue), forKey: regexOptionsKey)
}
