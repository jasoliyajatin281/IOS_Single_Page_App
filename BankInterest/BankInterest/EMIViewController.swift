//
//  EMIViewController.swift
//  BankInterest
//
//  Created by Student on 2019-07-17.
//  Copyright © 2019 Priyanka. All rights reserved.
//

import UIKit

class EMIViewController: UIViewController {

    
    @IBOutlet weak var PrincipalAmount: UITextField!
    @IBOutlet weak var RateAmount: UITextField!
    @IBOutlet weak var FrequencyAmount: UITextField!
    @IBOutlet weak var TimeAmount: UITextField!
    @IBOutlet weak var ErrorMessage: UILabel!
    @IBOutlet weak var CalculateButtonStyle: UIButton!
    @IBAction func CalculateButtonTap(_ sender: Any) {
        
        if let pricipleAmount = Double(PrincipalAmount.text!), let rate = Double(RateAmount.text!), let time = Int(TimeAmount.text!), let timePeriod = FrequencyAmount.text?.isEmpty, timePeriod == false  {
            
            let emiR = (rate/12) / 100
            let timePeriod = FrequencyAmount.text!
            let finalTimeN: Double = TimePeriod(timePeriod)
            let OnePlusRN: Double = pow((1 + emiR), Double(time))
            let EMIIntrest: Double = ((pricipleAmount * emiR * (OnePlusRN)) / (OnePlusRN - 1))
            let result = "EMI Interest: $\(round(1000*EMIIntrest)/1000)"
            ResultMessageBox.text = result
            ResultLabel.isHidden = false
            ResultMessageBox.isHidden = false
            
        } else { ErrorMessage.isHidden = false }
  
    }
    @IBOutlet weak var ResultLabel: UILabel!
    @IBOutlet weak var ResultMessageBox: UITextView!
    @IBOutlet weak var ClearAllButtonStyle: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pickerView = UIPickerView()
        pickerView.delegate = self
        FrequencyAmount.inputView = pickerView
        CalculateButtonStyle.backgroundColor = .clear
        CalculateButtonStyle.layer.cornerRadius = 10
        CalculateButtonStyle.layer.borderWidth = 1
        CalculateButtonStyle.layer.borderColor = UIColor.black.cgColor
        
        ClearAllButtonStyle.backgroundColor = .clear
        ClearAllButtonStyle.layer.cornerRadius = 10
        ClearAllButtonStyle.layer.borderWidth = 1
        ClearAllButtonStyle.layer.borderColor = UIColor.black.cgColor
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
    
    
    let CompoundFrequency = [String](arrayLiteral:"Daily", "Weekly", "Monthly", "Yearly")
    
    fileprivate func TimePeriod(_ timePeriod: String) -> Double{
        
        if(timePeriod == "Daily"){
            return 365
        } else if(timePeriod == "Weekly"){
            return 52.143
        }else if(timePeriod == "Monthly"){
            return 12.0
        }else if(timePeriod == "Yearly"){
            return 1.0
        }
        return 1.0
    }

}


extension EMIViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
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
