//
//  RegexOptionViewController.swift
//  Sanstring
//
//  Created by Fabian Canas on 12/25/14.
//  Copyright (c) 2014 Fabian Canas. All rights reserved.
//

import Cocoa

class RegexOptionViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        whitespaceButton.state = (GlobalRegexOptions.rawValue & NSRegularExpressionOptions.AllowCommentsAndWhitespace.rawValue) > 0 ? 1 : 0
        caseInsensitiveButton.state = (GlobalRegexOptions.rawValue & NSRegularExpressionOptions.CaseInsensitive.rawValue) > 0 ? 1 : 0
    }
    
    @IBOutlet weak var whitespaceButton: NSButton!
    @IBAction func toggleWhitespace(sender: NSButton) {
        GlobalRegexOptions = bitSetter(sender.state)(GlobalRegexOptions, NSRegularExpressionOptions.AllowCommentsAndWhitespace)
        NSNotificationCenter.defaultCenter().postNotificationName(RegexOptionsChangedKey, object: nil)
    }
    
    @IBOutlet weak var caseInsensitiveButton: NSButton!
    @IBAction func toggleCaseSensitivity(sender: NSButton) {
        GlobalRegexOptions = bitSetter(sender.state)(GlobalRegexOptions, NSRegularExpressionOptions.CaseInsensitive)
        NSNotificationCenter.defaultCenter().postNotificationName(RegexOptionsChangedKey, object: nil)
    }
}
