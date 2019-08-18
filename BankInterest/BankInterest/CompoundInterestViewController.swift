//
//  CompoundInterestViewController.swift
//  BankInterest
//
//  Created by Student on 2019-07-17.
//  Copyright © 2019 Priyanka. All rights reserved.
//

import UIKit

class CompoundInterestViewController: UIViewController {
   
    let pickerView1 = UIPickerView()
    let pickerView2 = UIPickerView()

    @IBOutlet weak var PrincipalAmount: UITextField!
    @IBOutlet weak var RateAmount: UITextField!
    @IBOutlet weak var LengthOfInvestmentAmount: UITextField!
    @IBOutlet weak var LengthOfTypeAmount: UITextField!
    @IBOutlet weak var TransactionFrequencyAmount: UITextField!
    @IBOutlet weak var WithdrawEachCycleAmount: UITextField!
    @IBOutlet weak var DepositEachCycleAmount: UITextField!
    @IBOutlet weak var CalculateButtonStyle: UIButton!
    @IBOutlet weak var ResultLabel: UILabel!
    
    @IBOutlet weak var ResultMessageBox: UITextView!
    @IBOutlet weak var ErrorMessage: UILabel!
  
    @IBAction func CalculateButtonTap(_ sender: Any) {
        
        if let pricipleAmount: Double = Double(PrincipalAmount.text!), let rate: Double = Double(RateAmount.text!), let lengthOfInvestmentAmount: Double = Double(LengthOfInvestmentAmount.text!), let lengthOfTypeAmount = LengthOfTypeAmount.text?.isEmpty, lengthOfTypeAmount == false, let transactionFrequencyAmount = TransactionFrequencyAmount.text?.isEmpty, transactionFrequencyAmount == false, var withdrawEachCycleAmount: Double = Double(WithdrawEachCycleAmount.text!), var depositEachCycleAmount:Double = Double(DepositEachCycleAmount.text!) {
            
            
            let AmountYypeLength = TimePeriodByMonth(LengthOfTypeAmount.text!)
            var payments = lengthOfInvestmentAmount * AmountYypeLength / 12
            var MonthlyAddition = depositEachCycleAmount
            var MonthlySubtraction = withdrawEachCycleAmount
            var FrequencyAddition = TimePeriodByYear(TransactionFrequencyAmount.text!)
            
            let transactionFrequencyType = TimePeriodByMonth(TransactionFrequencyAmount.text!)
            
            if FrequencyAddition == 0{
                FrequencyAddition = 12
                MonthlyAddition = 0
                MonthlySubtraction = 0
                withdrawEachCycleAmount = 0
                depositEachCycleAmount = 0
            }
            
            let i = rate / 100 / FrequencyAddition
            var AmmountPay: Double = Double(pow((1 + i), FrequencyAddition))
            AmmountPay = AmmountPay - 1 * 100
            
            var Principal = pricipleAmount
            var FinalPricipal = Principal
            
            var totalPayment: Double = payments * FrequencyAddition
            
            var count: Double = 0
            while (count < totalPayment){
                var newprincipal: Double = FinalPricipal + MonthlyAddition + MonthlySubtraction
                FinalPricipal = (newprincipal * i) + (FinalPricipal + MonthlyAddition + MonthlySubtraction)
                count = count + 1
            }
            
            var totinterest = (count * MonthlyAddition) + (Principal)
            var vtotalwithdraw = count * MonthlySubtraction
            var totalint = FinalPricipal - totinterest - vtotalwithdraw
            
            var savings = totalint + totinterest
          
            print(count)
            print(MonthlyAddition)
            print(Principal)
            print(totinterest)
            print(vtotalwithdraw)
            print(totalint)
            
            let result = "Total Deposite: \(round(1000*totinterest)/1000), \nTotal Withrawal: \(round(1000*vtotalwithdraw)/1000), \nEarned Interest: \(round(1000*totalint)/1000), \nTotal Savingss: \(round(1000*savings)/1000)"
            ResultMessageBox.text = result
            ResultLabel.isHidden = false
            ResultMessageBox.isHidden = false
            
        } else {
            ErrorMessage.isHidden = false
        }
        
        
    }
    
    @IBAction func ClearAll(_ sender: Any) {
        PrincipalAmount.text = ""
        RateAmount.text = ""
        LengthOfInvestmentAmount.text = ""
        LengthOfTypeAmount.text = ""
        TransactionFrequencyAmount.text = ""
        WithdrawEachCycleAmount.text = ""
        DepositEachCycleAmount.text = ""
        ErrorMessage.isHidden = true
        ResultLabel.isHidden = true
        ResultMessageBox.isHidden = true
    }
    
    @IBOutlet weak var ClearAllButtonStyle: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView1.delegate = self
        LengthOfTypeAmount.inputView = pickerView1
        
        pickerView2.delegate = self
        TransactionFrequencyAmount.inputView = pickerView2
        
        CalculateButtonStyle.backgroundColor = .clear
        CalculateButtonStyle.layer.cornerRadius = 10
        CalculateButtonStyle.layer.borderWidth = 1
        CalculateButtonStyle.layer.borderColor = UIColor.black.cgColor
        
        ClearAllButtonStyle.backgroundColor = .clear
        ClearAllButtonStyle.layer.cornerRadius = 10
        ClearAllButtonStyle.layer.borderWidth = 1
        ClearAllButtonStyle.layer.borderColor = UIColor.black.cgColor
        
    }
    
    let CompoundFrequency = [String](arrayLiteral: "Never","Daily", "Weekly", "Fortnightly", "Monthly", "Bi-Monthly","Quarterly", "Yearly", "Thrice-Yearly", "Half-Yearly")
    let lengthOfTypeFrequency = [String](arrayLiteral: "Daily", "Weekly", "Monthly", "Yearly")
    
    fileprivate func TimePeriodByMonth(_ timePeriod: String) -> Double{
        
        if(timePeriod == "Daily"){
            return 0.0328542094455852
        } else if(timePeriod == "Weekly"){
            return 0.2299794661190964
        
        }else if(timePeriod == "Monthly"){
            return 1.0
        }else if(timePeriod == "Yearly"){
            return 12.0
        }
        return 1.0
    }
    
    fileprivate func TimePeriodByYear(_ timePeriod: String) -> Double{
        
        if(timePeriod == "Never"){
            return 0
        } else if(timePeriod == "Daily"){
            return 365.25
        } else if(timePeriod == "Weekly"){
            return 52.17857
        } else if(timePeriod == "Fortnightly"){
            return 26.089285
        }else if(timePeriod == "Monthly"){
            return 12.0
        }else if(timePeriod == "Bi-Monthly"){
            return 6.0
        }else if(timePeriod == "Quarterly"){
            return 4.0
        }else if(timePeriod == "Yearly"){
            return 1.0
        }else if(timePeriod == "Thrice-Yearly"){
            return 3.0
        }else if(timePeriod == "Half-Yearly"){
            return 2.0
        }
        return 0.0
    }

   

}


extension CompoundInterestViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == pickerView1{
            return lengthOfTypeFrequency.count
            
        } else {
            return CompoundFrequency.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == pickerView1{
            LengthOfTypeAmount.text = lengthOfTypeFrequency[row]
            
        } else {
            TransactionFrequencyAmount.text = CompoundFrequency[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == pickerView1{
           return lengthOfTypeFrequency[row]
            
        } else {
            return CompoundFrequency[row]
        }
    }
}
