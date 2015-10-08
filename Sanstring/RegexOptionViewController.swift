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
        caseInsensitiveButton.state = (GlobalRegexOptions.rawValue & NSRegularExpressionOptions.CaseInsensitive.rawValue) > 0 ? 1 : 0
        whitespaceButton.state = (GlobalRegexOptions.rawValue & NSRegularExpressionOptions.AllowCommentsAndWhitespace.rawValue) > 0 ? 1 : 0
        ignoreMetaCharactersButton.state = (GlobalRegexOptions.rawValue & NSRegularExpressionOptions.IgnoreMetacharacters.rawValue) > 0 ? 1 : 0
        dotMatchesLineSeparatorsButton.state = (GlobalRegexOptions.rawValue & NSRegularExpressionOptions.DotMatchesLineSeparators.rawValue) > 0 ? 1 : 0
        anchorsMatchLinesButton.state = (GlobalRegexOptions.rawValue & NSRegularExpressionOptions.AnchorsMatchLines.rawValue) > 0 ? 1 : 0
        useUnixLineSeparatorsButton.state = (GlobalRegexOptions.rawValue & NSRegularExpressionOptions.UseUnixLineSeparators.rawValue) > 0 ? 1 : 0
        useUnicodeWordBoundariesButton.state = (GlobalRegexOptions.rawValue & NSRegularExpressionOptions.UseUnicodeWordBoundaries.rawValue) > 0 ? 1 : 0
    }
    
    @IBOutlet weak var caseInsensitiveButton: NSButton!
    @IBAction func toggleCaseSensitivity(sender: NSButton) {
        GlobalRegexOptions = bitSetter(sender.state)(GlobalRegexOptions, NSRegularExpressionOptions.CaseInsensitive)
    }
    
    @IBOutlet weak var whitespaceButton: NSButton!
    @IBAction func toggleWhitespace(sender: NSButton) {
        GlobalRegexOptions = bitSetter(sender.state)(GlobalRegexOptions, NSRegularExpressionOptions.AllowCommentsAndWhitespace)
    }
    
    @IBOutlet weak var ignoreMetaCharactersButton: NSButton!
    @IBAction func toggleIgnoreMetaCharacters(sender: NSButton) {
        GlobalRegexOptions = bitSetter(sender.state)(GlobalRegexOptions, NSRegularExpressionOptions.IgnoreMetacharacters)
    }
    
    @IBOutlet weak var dotMatchesLineSeparatorsButton: NSButton!
    @IBAction func toggleDotMatchesLineSeparatos(sender: NSButton) {
        GlobalRegexOptions = bitSetter(sender.state)(GlobalRegexOptions, NSRegularExpressionOptions.DotMatchesLineSeparators)
    }
    
    @IBOutlet weak var anchorsMatchLinesButton: NSButton!
    @IBAction func toggleAnchorsMatchLines(sender: NSButton) {
        GlobalRegexOptions = bitSetter(sender.state)(GlobalRegexOptions, NSRegularExpressionOptions.AnchorsMatchLines)
    }
    
    @IBOutlet weak var useUnixLineSeparatorsButton: NSButton!
    @IBAction func toggleUseUnixLineSeparators(sender: NSButton) {
        GlobalRegexOptions = bitSetter(sender.state)(GlobalRegexOptions, NSRegularExpressionOptions.UseUnixLineSeparators)
    }
    
    @IBOutlet weak var useUnicodeWordBoundariesButton: NSButton!
    @IBAction func toggleUseUnicodeWordBoundaries(sender: NSButton) {
        GlobalRegexOptions = bitSetter(sender.state)(GlobalRegexOptions, NSRegularExpressionOptions.UseUnicodeWordBoundaries)
    }
}
