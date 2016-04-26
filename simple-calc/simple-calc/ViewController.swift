//
//  ViewController.swift
//  simple-calc
//
//  Created by Annie Lace on 4/19/16.
//  Copyright © 2016 Annie Lace. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var leftString : String? = nil;
    var rightString : String? = nil;
    var operation : String? = nil;
    var count : Int = 1;
    var total : Int? = nil;
    var displayString : String = "";
    var historyString : String = "";
    
    @IBOutlet weak var display: UILabel!
    
    private func setNumAndDisplay(num : Int)
    {
        if(operation == nil)
        {
            if(leftString == nil)
            {
                leftString = "\(num)"
                displayString = "\(num)"
            }
            else
            {
                leftString! += "\(num)"
                displayString += "\(num)"
            }
            
        }
        else if(operation != nil && operation != "!")
        {
            if(rightString == nil)
            {
                rightString = "\(num)"
            }
            else
            {
                rightString! += "\(num)"
            }
            displayString += "\(num)"
        }
        display.text = "\(displayString)"
    }
    
    private func setOperation(op : String)
    {
        if(operation == nil && leftString != nil)
        {
            operation = op
            displayString += "\(op)"
        }
        display.text = "\(displayString)"
    }
    
    @IBAction func ZeroButtonClicked(sender: UIButton) {
        setNumAndDisplay(0)
    }
    
    @IBAction func OneButtonClicked(sender: UIButton) {
        setNumAndDisplay(1)
    }
    
    @IBAction func TwoButtonClicked(sender: UIButton) {
        setNumAndDisplay(2)
    }
    
    @IBAction func ThreeButtonClicked(sender: UIButton) {
        setNumAndDisplay(3)
    }
    
    @IBAction func FourButtonClicked(sender: UIButton) {
        setNumAndDisplay(4)
    }
    
    @IBAction func FiveButtonClicked(sender: UIButton) {
        setNumAndDisplay(5)
    }
    
    @IBAction func SixButtonClicked(sender: UIButton) {
        setNumAndDisplay(6)
    }
    
    @IBAction func SevenButtonClicked(sender: UIButton) {
        setNumAndDisplay(7)
    }
    
    @IBAction func EightButtonClicked(sender: UIButton) {
        setNumAndDisplay(8)
    }
    
    @IBAction func NineButtonClicked(sender: UIButton) {
        setNumAndDisplay(9)
    }
    
    @IBAction func EqualsButtonClicked(sender: UIButton) {
        if(operation != nil && leftString != nil)
        {
            let leftNum = UInt.init(leftString!)!
            //can't assume a value in case of single count, single avg or factorial
            var rightNum = 0
            if(rightString != nil)
            {
                rightNum = (Int)(UInt.init(rightString!)!)
            }
            
            var answer = 0
            switch(operation!)
            {
                case "+" : answer = (Int)(leftNum) + (Int)(rightNum)
                case "-" : answer = (Int)(leftNum) - (Int)(rightNum)
                case "*" : answer = (Int)(leftNum) * (Int)(rightNum)
                case "/" : answer = (Int)(leftNum) / (Int)(rightNum)
                case "%" : answer = (Int)(leftNum) % (Int)(rightNum)
                case "Count" : answer = count
                case "Avg" : answer = (Int)(total!) / count
                case "!" : answer = fact((Int)(leftNum))
                default: break;
            }
            displayString += "=\(answer)"
            display.text = "\(displayString)"
            historyString += "\(displayString) "
            operation = nil
            leftString = nil
            rightString = nil
            count = 1
            total = nil
        }
    }
    
    @IBAction func PlusButtonClicked(sender: UIButton) {
        setOperation("+")
    }
    
    @IBAction func MinusButtonClicked(sender: UIButton) {
        setOperation("-")
    }
    
    @IBAction func MultButtonClicked(sender: UIButton) {
        setOperation("*")
    }
    
    @IBAction func DivButtonClicked(sender: UIButton) {
        setOperation("/")
    }
    
    @IBAction func ModButtonClicked(sender: UIButton) {
        setOperation("%")
    }
    
    @IBAction func CountButtonClicked(sender: UIButton) {
        if((operation == nil || operation == "Count") && leftString != nil)
        {
            operation = "Count"
            displayString += "Count"
            if(rightString != nil)
            {
                count += 1
                rightString = nil
            }
        }
        display.text = "\(displayString)"
    }
    
    @IBAction func AvgButtonClicked(sender: UIButton) {
        if((operation == nil || operation == "Avg") && leftString != nil)
        {
            operation = "Avg"
            displayString += "Avg"
            if(rightString != nil)
            {
                total! += (Int)(UInt.init(rightString!)!)
                count += 1
                rightString = nil
            }
            else
            {
                total = (Int)(UInt.init(leftString!)!)
            }
        }
        display.text = "\(displayString)"
    }
    
    @IBAction func FactButtonClicked(sender: UIButton) {
        setOperation("!");
    }
    
    func fact(number:Int) -> Int
    {
        var result = 1
        for(var i = 1; i <= number; i += 1)
        {
            result = result * i;
        }
        return result;
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if(segue.identifier == "historySegue")
        {
            let historyViewController = segue.destinationViewController as! HistoryViewController
            historyViewController.historyString = historyString
        }
    }

}

