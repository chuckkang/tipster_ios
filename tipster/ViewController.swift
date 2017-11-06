//
//  ViewController.swift
//  tipster
//
//  Created by Chucks Mac Book on 11/2/17.
//  Copyright © 2017 Chucks Mac Book. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Amount: UILabel!
    @IBOutlet weak var lowPercent: UILabel!
    @IBOutlet weak var lowSingleAmount: UILabel!
    
    @IBOutlet weak var medPercent: UILabel!
    @IBOutlet weak var medSingleAmount: UILabel!
    
    @IBOutlet weak var highPercent: UILabel!
    @IBOutlet weak var highSingleAmount: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    var number: Double = 0.00
    var number2: Double = 0.00
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setDefaultValues()
    }
    func setDefaultValues(){
        self.Amount.text = ""
        self.lowPercent.text = "0"
        self.lowSingleAmount.text = "0"
        self.medPercent.text = "0"
        self.medSingleAmount.text = "0"
        self.highPercent.text = "0"
        self.highSingleAmount.text = "0"
    }
    
    @IBAction func decimalPressed(_ sender: UIButton) {
        var checkString: String=""
        checkString = self.Amount.text! + "."
        if let valid = Double(checkString){
            updateAmountLabel(amount: String(valid))
        }
    }
    @IBAction func updateAmount(_ sender: UIButton) {
        // updateAmount: user presses number button and updates the Amount label by appending to the label text
        self.Amount.text = self.Amount.text! + String(sender.tag)
    }
    
    func updateAmountLabel(amount: String){
        // updateAmountLabel:  updates the AmountLabel, but will also update the tip percent area.
        self.Amount.text = amount
        
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        let tipPercent: Int = Int(slider.value*30)
        updatePercentArea(tipAmount: tipPercent)
    }
    func updatePercentArea(tipAmount: Int){
        let lowTip: Int = tipAmount
        let midTip: Int = tipAmount + 5
        let highTip: Int = tipAmount + 10
        
        self.lowPercent.text = String(lowTip)
        self.medPercent.text = String(midTip)
        self.highPercent.text = String(highTip)
        
        self.lowSingleAmount.text = String(updatePercentAmounts(tipAmount: lowTip))
        self.medSingleAmount.text = String(updatePercentAmounts(tipAmount: midTip))
        self.highSingleAmount.text = String(updatePercentAmounts(tipAmount: highTip))
    }
    
    func updatePercentAmounts(tipAmount: Int)->Double{
        // updatePercentAmount:  takes in dblAmount, and
        var result: Double = 0
        result = (Double(tipAmount) * Double(self.Amount.text!)!)/Double(100.00)
        return result
    }
    @IBAction func clearPressed(_ sender: UIButton) {
        setDefaultValues()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

