//
//  SettingsViewController.swift
//  TipCalcutator
//
//  Created by Youcef Iratni on 12/13/15.
//  Copyright © 2015 Youcef Iratni. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    @IBOutlet weak var GoButton: UIButton!
    @IBOutlet weak var TipInputField: UITextField!
    
    @IBOutlet weak var segControl: UISegmentedControl!
    var lowestTip: Float = 0.0
    var midLowTip: Float = 0.0
    var midTip: Float = 0.0
    var midHighTip: Float = 0.0
    var highestTip: Float = 0.0
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        var isFirstLoad = userDefaults.boolForKey("is_First_Load")
        lowestTip = userDefaults.floatForKey("lowest_tip")
        midLowTip = userDefaults.floatForKey("midLow_tip")
        midTip = userDefaults.floatForKey("mid_tip")
        midHighTip = userDefaults.floatForKey("midHigh_tip")
        highestTip = userDefaults.floatForKey("highest_tip")
        
        segControl.setTitle("\(Int(lowestTip * 100))%", forSegmentAtIndex: 0)
        segControl.setTitle("\(Int(midLowTip * 100))%", forSegmentAtIndex: 1)
        segControl.setTitle("\(Int(midTip * 100))%", forSegmentAtIndex: 2)
        segControl.setTitle("\(Int(midHighTip * 100))%", forSegmentAtIndex: 3)
        segControl.setTitle("\(Int(highestTip * 100))%", forSegmentAtIndex: 4)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultTip = defaults.integerForKey("default_tip")
        print("got default tip: \(defaultTip)")
        switch defaultTip {
        case 0...2:
            segControl.selectedSegmentIndex = defaultTip
        default:
            segControl.selectedSegmentIndex = 0
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func TipInputOnTap(sender: AnyObject) {
        
        segControl.setTitle("\(TipInputField.text!)%", forSegmentAtIndex: segControl.selectedSegmentIndex)
        
        let TipInputValue = NSString(string: TipInputField.text!).integerValue
        print("Tip Input Value = \(TipInputValue)")
        
        let newTipAmount = Float(TipInputValue) / 100;
        let defaults = NSUserDefaults.standardUserDefaults()
        
        var key : String
        switch(segControl.selectedSegmentIndex)
        {
        case 0:
            key = "lowest_tip"
        case 1:
            key = "midLow_tip"
        case 2:
            key = "mid_tip"
        case 3:
            key = "midHigh_tip"
        case 4:
            key = "highest_tip"
        default:
            key = ""
            print("something weird happened, is your case statement exhaustive?")
        }
        
        print("Setting new tip amount for \(key):\(newTipAmount)")
        
        defaults.setFloat(newTipAmount, forKey: key)
        
        // lowest_tip is now the text input field value divided by 100
        
        
    }
    
    
    
    
    @IBAction func DoneEditing(sender: AnyObject) {
        TipInputField.endEditing(true)
    }
    @IBAction func editingDone(sender: AnyObject) {
        view.endEditing(true)
    }
    @IBAction func segControlTapped(sender: AnyObject) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setInteger(sender.selectedSegmentIndex, forKey: "default_tip")
        
        defaults.synchronize()
        
    }
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
