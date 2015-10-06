//
//  ViewController.swift
//  Sanstring
//
//  Created by Fabian Canas on 12/24/14.
//  Copyright (c) 2014 Fabian Canas. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "textDidChange:", name: NSControlTextDidChangeNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "textDidChange:", name: RegexOptionsChangedKey, object: nil)
    }
    
    @IBOutlet var inputTextView: NSTextView!
    @IBOutlet weak var regexTextField: NSTextField!
    @IBOutlet weak var replaceTextField: NSTextField!
    @IBOutlet var outputTextView: NSTextView!
    
    func textDidChange(notification: NSNotification) {
        let regex: NSRegularExpression?
        do {
            regex = try NSRegularExpression(pattern: regexTextField.stringValue, options: globalRegexOptions())
        } catch _ {
            regex = nil
        }
        let inputString = inputTextView.string ?? ""
        outputTextView.string = regex?.stringByReplacingMatchesInString(inputString, options: [], range: NSMakeRange(0, inputString.characters.count), withTemplate: replaceTextField.stringValue) ?? ""
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
}

