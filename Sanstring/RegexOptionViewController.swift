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
        
        _ = [caseInsensitiveButton,
            whitespaceButton,
            ignoreMetaCharactersButton,
            dotMatchesLineSeparatorsButton,
            anchorsMatchLinesButton,
            useUnixLineSeparatorsButton,
            useUnicodeWordBoundariesButton].map {
                $0.state = (GlobalRegexOptions.rawValue & option($0)!.rawValue) > 0 ? 1 : 0
        }
    }
    
    func option(control: NSButton) -> NSRegularExpressionOptions? {
        return [caseInsensitiveButton      : NSRegularExpressionOptions.CaseInsensitive,
            whitespaceButton               : NSRegularExpressionOptions.AllowCommentsAndWhitespace,
            ignoreMetaCharactersButton     : NSRegularExpressionOptions.IgnoreMetacharacters,
            dotMatchesLineSeparatorsButton : NSRegularExpressionOptions.DotMatchesLineSeparators,
            anchorsMatchLinesButton        : NSRegularExpressionOptions.AnchorsMatchLines,
            useUnixLineSeparatorsButton    : NSRegularExpressionOptions.UseUnixLineSeparators,
            useUnicodeWordBoundariesButton : NSRegularExpressionOptions.UseUnicodeWordBoundaries][control]
    }
    
    @IBOutlet weak var caseInsensitiveButton: NSButton!
    @IBAction func toggleOption(sender: NSButton) {
        GlobalRegexOptions = bitSetter(sender.state)(GlobalRegexOptions, option(sender)!)
    }
    
    @IBOutlet weak var whitespaceButton: NSButton!
    
    @IBOutlet weak var ignoreMetaCharactersButton: NSButton!
    
    @IBOutlet weak var dotMatchesLineSeparatorsButton: NSButton!
    
    @IBOutlet weak var anchorsMatchLinesButton: NSButton!
    
    @IBOutlet weak var useUnixLineSeparatorsButton: NSButton!
    
    @IBOutlet weak var useUnicodeWordBoundariesButton: NSButton!
}
