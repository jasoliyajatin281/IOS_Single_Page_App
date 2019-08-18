//
//  CompoundViewController.swift
//  BankInterest
//
//  Created by Student on 2019-07-17.
//  Copyright © 2019 Priyanka. All rights reserved.
//

import UIKit

class CompoundViewController: UIViewController {
    
    @IBOutlet weak var PrincipalAmount: UITextField!
    @IBOutlet weak var RateAmount: UITextField!
    @IBOutlet weak var TimeAmount: UITextField!
    @IBOutlet weak var FrequencyAmount: UITextField!
    @IBOutlet weak var ErrorMessage: UILabel!
    @IBOutlet weak var ResultLabel: UILabel!
    @IBOutlet weak var ResultMessageBox: UITextView!
    @IBOutlet weak var CalculateButtonStyle: UIButton!
    @IBAction func CalculateButtonTap(_ sender: Any) {
        
        if let pricipleAmount = Double(PrincipalAmount.text!), let rate = Double(RateAmount.text!), let time = Int(TimeAmount.text!), let timePeriod = FrequencyAmount.text?.isEmpty, timePeriod == false  {
            
            let compundR = rate / 100
            let timePeriod = FrequencyAmount.text!
            let finalRate: Double = TimePeriod(timePeriod)
            let OnePlusR = 1 + (compundR / finalRate)
            let nt = finalRate * Double(time)
            let Compund: Double = pricipleAmount * pow(OnePlusR, nt)
            let CompoundIntrest: Double = Compund - pricipleAmount
            
            let FV = pricipleAmount * pow(OnePlusR,nt)
            let PV = FV / pow(OnePlusR,nt)
            
            let result = "Compound: $\(round(1000*Compund)/1000),\nCompound Interest: $\(round(1000*CompoundIntrest)/1000),\nFuture Value: $\(round(1000*FV)/1000),\nPresent Value: $\(round(1000*PV)/1000)"
            ResultMessageBox.text = result
            ResultLabel.isHidden = false
            ResultMessageBox.isHidden = false
        } else { ErrorMessage.isHidden = false }
    }
    
    @IBAction func ClearAllButtonTap(_ sender: Any) {
        PrincipalAmount.text = ""
        RateAmount.text = ""
        FrequencyAmount.text = ""
        TimeAmount.text = ""
        ResultLabel.isHidden = true
        ResultMessageBox.text = ""
        ResultMessageBox.isHidden = true
        ErrorMessage.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CalculateButtonStyle.backgroundColor = .clear
        CalculateButtonStyle.layer.cornerRadius = 5
        CalculateButtonStyle.layer.borderWidth = 1
        CalculateButtonStyle.layer.borderColor = UIColor.black.cgColor
        let pickerView = UIPickerView()
        pickerView.delegate = self
        FrequencyAmount.inputView = pickerView
    }
   
    let CompoundFrequency = [String](arrayLiteral:"Daily", "Weekly", "Fortnightly", "Monthly", "Bi-Monthly","Quarterly", "Yearly", "Thrice-Yearly", "Half-Yearly")
    
    fileprivate func TimePeriod(_ timePeriod: String) -> Double{
        
        if(timePeriod == "Daily"){
            return 365
        } else if(timePeriod == "Weekly"){
            return 52.143
        } else if(timePeriod == "Fortnightly"){
            return 26.071
        }else if(timePeriod == "Monthly"){
            return 12.0
        }else if(timePeriod == "Bi-Monthly"){
            return 24.0
        }else if(timePeriod == "Quarterly"){
            return 4.0
        }else if(timePeriod == "Yearly"){
            return 1.0
        }else if(timePeriod == "Thrice-Yearly"){
            return 3.0
        }else if(timePeriod == "Half-Yearly"){
            return 2
        }
        return 0.0
    }
}

extension CompoundViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return CompoundFrequency.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        FrequencyAmount.text = CompoundFrequency[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return CompoundFrequency[row]
    }
}
