//
//  AddViewController.swift
//  Workshop1
//
//  Created by Yucong Li on 9/3/15.
//  Copyright (c) 2015 Yucong Li. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
        var newItem: Workshop1Item?
    
    @IBAction func cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion:nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DoneItem" {
            if let name = textField.text {
                if !name.isEmpty {
                    newItem = Workshop1Item(name: name)
                }
            }
        }
    }
}

