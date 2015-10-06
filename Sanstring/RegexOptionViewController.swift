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
        let opts = globalRegexOptions()
        whitespaceButton.state = (opts.rawValue & NSRegularExpressionOptions.AllowCommentsAndWhitespace.rawValue) > 0 ? 1 : 0
        caseInsensitiveButton.state = (opts.rawValue & NSRegularExpressionOptions.CaseInsensitive.rawValue) > 0 ? 1 : 0
    }
    
    @IBOutlet weak var whitespaceButton: NSButton!
    @IBAction func toggleWhitespace(sender: NSButton) {
        setGlobalRegexOptions(bitSetter(sender.state)(globalRegexOptions(), NSRegularExpressionOptions.AllowCommentsAndWhitespace))
        NSNotificationCenter.defaultCenter().postNotificationName(RegexOptionsChangedKey, object: nil)
    }
    
    @IBOutlet weak var caseInsensitiveButton: NSButton!
    @IBAction func toggleCaseSensitivity(sender: NSButton) {
        setGlobalRegexOptions(bitSetter(sender.state)(globalRegexOptions(), NSRegularExpressionOptions.CaseInsensitive))
        NSNotificationCenter.defaultCenter().postNotificationName(RegexOptionsChangedKey, object: nil)
    }
}
