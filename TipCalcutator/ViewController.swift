//
//  ViewController.swift
//  TipCalcutator
//
//  Created by Youcef Iratni on 12/9/15.
//  Copyright © 2015 Youcef Iratni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var lowestTip: Float = 0.0
    var midLowTip: Float = 0.0
    var midTip: Float = 0.0
    var midHighTip: Float = 0.0
    var highestTip: Float = 0.0

    @IBOutlet weak var tip5Label: UILabel!
    @IBOutlet weak var tip4Label: UILabel!
    @IBOutlet weak var tip3Label: UILabel!
    @IBOutlet weak var tip2Label: UILabel!
    @IBOutlet weak var tip1Label: UILabel!
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var TipsLabel: UILabel!
    @IBOutlet weak var TotaleLabel: UILabel!
    
    
    @IBOutlet weak var TipPersonLabel: UILabel!
    @IBOutlet weak var TipTotalLabel: UILabel!
    @IBOutlet weak var TotalPersonLabel: UILabel!
    @IBOutlet weak var ToTalLabel: UILabel!
    @IBOutlet weak var ValueTipPersonLabel: UILabel!
    @IBOutlet weak var ValueTipTotalLabel: UILabel!
    @IBOutlet weak var ValueTotalPersonLabel: UILabel!
    @IBOutlet weak var ValueToTalLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var NumPPLindicatorLabel: UILabel!
    
    
    
    var totalAmountPerson : Float = 0.0
    var tipAmountPerson : Float = 0.0
    var NumPeople : Int = 0
    var valueToTPerson : Float = 0.0
    var valueTipPerson : Float = 0.0
    var tip : Float = 0.0
    var total : Float = 0.0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        tip1Label.text = "$0.0"
        tip2Label.text = "$0.0"
        tip3Label.text = "$0.0"
        tip4Label.text = "$0.0"
        tip5Label.text = "$0.0"
        
        ValueTipPersonLabel.text = "$0.0"
        ValueTipTotalLabel.text = "$0.0"
        ValueTotalPersonLabel.text = "$0.0"
        ValueToTalLabel.text = "$0.0"
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
       
        billField.text = defaults.stringForKey("lastAmount")
        tipLabel.text = defaults.stringForKey("lasttipAmount")
        totalLabel.text = defaults.stringForKey("lasttotalAmount")
        
        ValueTipPersonLabel.text = defaults.stringForKey("lastValueTipPersonAmount")
        ValueTipTotalLabel.text = defaults.stringForKey("lastValueTipTotalAmount")
        ValueTotalPersonLabel.text = defaults.stringForKey("lastValueTotalPersonAmount")
        ValueToTalLabel.text = defaults.stringForKey("lastValueToTalAmount")
        
        NumPPLindicatorLabel.text = defaults.stringForKey("lastNumPPLindicatorAmount")
        
        slider.value = defaults.floatForKey("lastsliderAmount")
        tipControl.selectedSegmentIndex = defaults.integerForKey("lasttipControlAmount")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
            let userDefaults = NSUserDefaults.standardUserDefaults()
//            var isFirstLoad = userDefaults.boolForKey("is_First_Load")
        
        // start
        let defaultTip = userDefaults.integerForKey("default_tip")
        print("got default tip: \(defaultTip)")
        switch defaultTip {
        case 0...2:
            tipControl.selectedSegmentIndex = defaultTip
        default:
            tipControl.selectedSegmentIndex = 0
        }
        // end
        
        
            lowestTip = userDefaults.floatForKey("lowest_tip")
            midLowTip = userDefaults.floatForKey("midLow_tip")
            midTip = userDefaults.floatForKey("mid_tip")
            midHighTip = userDefaults.floatForKey("midHigh_tip")
            highestTip = userDefaults.floatForKey("highest_tip")

            tipControl.setTitle("\(Int(lowestTip * 100))%", forSegmentAtIndex: 0)
            tipControl.setTitle("\(Int(midLowTip * 100))%", forSegmentAtIndex: 1)
            tipControl.setTitle("\(Int(midTip * 100))%", forSegmentAtIndex: 2)
            tipControl.setTitle("\(Int(midHighTip * 100))%", forSegmentAtIndex: 3)
            tipControl.setTitle("\(Int(highestTip * 100))%", forSegmentAtIndex: 4)
    }

    override func viewWillDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("View Will Disapear")
        let BillText = billField.text
        let tipAmount = tipLabel.text
        let totalAmount = totalLabel.text
        
        let ValueTipPersonAmount = ValueTipPersonLabel.text
        let ValueTipTotalAmount = ValueTipTotalLabel.text
        let ValueTotalPersonAmount = ValueTotalPersonLabel.text
        let ValueToTalAmount = ValueToTalLabel.text
        
        let NumPPLindicatorAmount = NumPPLindicatorLabel.text
        
        let sliderAmount = slider.value
        let tipControlAmount = tipControl.selectedSegmentIndex
        
        
        
        NSUserDefaults.standardUserDefaults().setObject(BillText, forKey: "lastAmount")
        NSUserDefaults.standardUserDefaults().setObject(tipAmount, forKey: "lasttipAmount")
        NSUserDefaults.standardUserDefaults().setObject(totalAmount, forKey: "lasttotalAmount")
        
        NSUserDefaults.standardUserDefaults().setObject(ValueTipPersonAmount, forKey: "lastValueTipPersonAmount")
        NSUserDefaults.standardUserDefaults().setObject(ValueTipTotalAmount, forKey: "lastValueTipTotalAmount")
        NSUserDefaults.standardUserDefaults().setObject(ValueTotalPersonAmount, forKey: "lastValueTotalPersonAmount")
        NSUserDefaults.standardUserDefaults().setObject(ValueToTalAmount, forKey: "lastValueToTalAmount")
        
        NSUserDefaults.standardUserDefaults().setObject(NumPPLindicatorAmount, forKey: "lastNumPPLindicatorAmount")
        
        NSUserDefaults.standardUserDefaults().setObject(sliderAmount, forKey: "lastsliderAmount")
        NSUserDefaults.standardUserDefaults().setObject(tipControlAmount, forKey: "lasttipControlAmount")
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func switchChanged(sender: AnyObject) {
        
        let theSwitch = sender as! UISwitch
        if theSwitch.on {
            slider.hidden = false
            NumPPLindicatorLabel.hidden = false
            TipPersonLabel.hidden = false
            TipTotalLabel.hidden = false
            TotalPersonLabel.hidden = false
            ToTalLabel.hidden = false
            ValueTipPersonLabel.hidden = false
            ValueTipTotalLabel.hidden = false
            ValueTotalPersonLabel.hidden = false
            ValueToTalLabel.hidden = false
            tipLabel.hidden = true
            totalLabel.hidden = true
            TipsLabel.hidden = true
            TotaleLabel.hidden = true
        } else {
            slider.hidden = true
            NumPPLindicatorLabel.hidden = true
            TipPersonLabel.hidden = true
            TipTotalLabel.hidden = true
            TotalPersonLabel.hidden = true
            ToTalLabel.hidden = true
            ValueTipPersonLabel.hidden = true
            ValueTipTotalLabel.hidden = true
            ValueTotalPersonLabel.hidden = true
            ValueToTalLabel.hidden = true
            tipLabel.hidden = false
            totalLabel.hidden = false
            TipsLabel.hidden = false
            TotaleLabel.hidden = false
        }

    }
    @IBAction func onSliderChanged(sender: AnyObject) {
        
        NumPeople = Int(slider.value)
        
        valueToTPerson = (total / Float(NumPeople))
        valueTipPerson = (tip / Float(NumPeople))
        
        
        ValueTotalPersonLabel.text = "\(valueToTPerson)"
        ValueTipPersonLabel.text = "\(valueTipPerson)"
        NumPPLindicatorLabel.text = "\(NumPeople) ways"
        
        ValueTotalPersonLabel.text = String(format: "$%.1f/ea", valueToTPerson)
        ValueTipPersonLabel.text = String(format: "$%.1f/ea", valueTipPerson)
    }


    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [lowestTip, midLowTip, midTip, midHighTip, highestTip]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).floatValue
        tip = billAmount * tipPercentage
        total = billAmount + tip
        
        totalAmountPerson = total
        tipAmountPerson = tip
        
        let tip1 = billAmount * lowestTip
        let tip2 = billAmount * midLowTip
        let tip3 = billAmount * midTip
        let tip4 = billAmount * midHighTip
        let tip5 = billAmount * highestTip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tip1Label.text = "$\(tip1)"
        tip2Label.text = "$\(tip2)"
        tip3Label.text = "$\(tip3)"
        tip4Label.text = "$\(tip4)"
        tip5Label.text = "$\(tip5)"
        
        ValueTipTotalLabel.text = "$\(tip)"
        ValueToTalLabel.text = "$\(total)"
        
        
        tipLabel.text = String(format: "$%.1f", tip)
        totalLabel.text = String(format: "$%.1f", total)
        
        ValueTipTotalLabel.text = String(format: "$%.1f", tip)
        ValueToTalLabel.text = String(format: "$%.1f", total)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

