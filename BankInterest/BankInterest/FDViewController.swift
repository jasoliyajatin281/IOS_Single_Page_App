//
//  FDViewController.swift
//  BankInterest
//
//  Created by Student on 2019-07-17.
//  Copyright © 2019 Priyanka. All rights reserved.
//

import UIKit

class FDViewController: UIViewController {
    let pickerView1 = UIPickerView()
    let pickerView2 = UIPickerView()

    @IBOutlet weak var PrincipalAmount: UITextField!
    @IBOutlet weak var RateAmount: UITextField!
    @IBOutlet weak var FrequencyAmount: UITextField!
    @IBOutlet weak var TimeAmount: UITextField!
    @IBOutlet weak var PeriodType: UITextField!
    @IBOutlet weak var ErrorMessage: UILabel!
    @IBOutlet weak var CalculateButtonStyle: UIButton!
    @IBAction func CalculateButtonTap(_ sender: Any) {
        
        if let pricipleAmount = Double(PrincipalAmount.text!), let rate = Double(RateAmount.text!), let time = Int(TimeAmount.text!), let timePeriod = PeriodType.text?.isEmpty, timePeriod == false, let frequencyTime = FrequencyAmount.text?.isEmpty, frequencyTime == false  {
            
            var maturityValue: Double = Double("0")!
            let fdFrequency = FrequencyAmount.text!
            let tenure: Double = TimePeriod(fdFrequency)
            let fdPeriodType = PeriodType.text!
            var frequency = TimePeriod(fdPeriodType)
            print(tenure)
            print(frequency)
            if(time <= 90 && tenure == 365){
                frequency = 0
            }
            if(frequency == 0){
        
                maturityValue = Double(pricipleAmount * (1 + ((rate * Double(time)) / (Double(time) * 100))))
            } else {
                var value1: Double = 1 + rate/(100 * frequency)
                var value2: Double = (Double(time) * frequency) / frequency
                var value3: Double = 0
                
                value3 = pow(value1, value2)
                print(value3)
                maturityValue = pricipleAmount * value3
                
                
            }
            print(maturityValue)
            print(maturityValue - pricipleAmount)
            let result = "Maturity Amount: $\(round(1000*maturityValue)/1000),\nEarned Interest: $\(round(1000*maturityValue - pricipleAmount)/1000), \nInvestment Amount: $\(pricipleAmount)"
            ResultMessageBox.text = result
            ResultLabel.isHidden = false
            ResultMessageBox.isHidden = false
            
        } else { ErrorMessage.isHidden = false }
    }
    @IBOutlet weak var ResultLabel: UILabel!
    @IBOutlet weak var ResultMessageBox: UITextView!
    
    @IBOutlet weak var ClearAllButtonStyle: UIButton!
    @IBAction func ClearAllButtonTap(_ sender: Any) {
        PrincipalAmount.text = ""
        RateAmount.text = ""
        FrequencyAmount.text = ""
        TimeAmount.text = ""
        ResultLabel.isHidden = true
        ResultMessageBox.text = ""
        ResultMessageBox.isHidden = true
        PeriodType.text = ""
        ErrorMessage.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView1.delegate = self
        FrequencyAmount.inputView = pickerView1
        
        pickerView2.delegate = self
        PeriodType.inputView = pickerView2
        
        CalculateButtonStyle.backgroundColor = .clear
        CalculateButtonStyle.layer.cornerRadius = 10
        CalculateButtonStyle.layer.borderWidth = 1
        CalculateButtonStyle.layer.borderColor = UIColor.black.cgColor
        
        ClearAllButtonStyle.backgroundColor = .clear
        ClearAllButtonStyle.layer.cornerRadius = 10
        ClearAllButtonStyle.layer.borderWidth = 1
        ClearAllButtonStyle.layer.borderColor = UIColor.black.cgColor
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
        return 365
    }

}


extension FDViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return CompoundFrequency.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == pickerView1{
            FrequencyAmount.text = CompoundFrequency[row]
            
        } else {
            PeriodType.text = CompoundFrequency[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return CompoundFrequency[row]
    }
}
