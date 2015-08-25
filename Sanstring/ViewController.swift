//
//  ViewController.swift
//  Sanstring
//
//  Created by Fabian Canas on 12/24/14.
//  Copyright (c) 2014 Fabian Canas. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSTextViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("textDidChange:"), name: NSControlTextDidChangeNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("textDidChange:"), name: "RegexOptionsChanged", object: nil)
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBOutlet var inputTextView: NSTextView!
    @IBOutlet weak var regexTextField: NSTextField!
    @IBOutlet weak var replaceTextField: NSTextField!
    @IBOutlet var outputTextView: NSTextView!
    
    func textDidChange(notification: NSNotification) {
        let e = NSErrorPointer()
        let regex = NSRegularExpression(pattern: regexTextField.stringValue, options: globalRegexOptions(), error: e)
        let inputString = inputTextView.string ?? ""
        outputTextView.string = regex?.stringByReplacingMatchesInString(inputString, options: nil, range: NSMakeRange(0, count(inputString)), withTemplate: replaceTextField.stringValue) ?? ""
    }
}

