//
//  HistoryViewController.swift
//  simple-calc
//
//  Created by Annie Lace on 4/24/16.
//  Copyright © 2016 Annie Lace. All rights reserved.
//

import UIKit

class HistoryViewController : UIViewController {

    @IBOutlet weak var historyText: UILabel!
    var historyString : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        historyText.text = historyString
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
