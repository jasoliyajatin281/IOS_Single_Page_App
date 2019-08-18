//
//  QuoteViewController.swift
//  QuoteMe
//
//  Created by Student on 2019-06-02.
//  Copyright © 2019 Priyanka. All rights reserved.
//

import UIKit

class QuoteViewController: UIViewController {
   
    var Quotes:[Quote] = []
    
    
    @IBOutlet weak var QuoteLabel: UILabel!
    
    @IBOutlet weak var PersonImageView: UIImageView!
    
    @IBOutlet weak var InspiredByLabel: UILabel!
    
    fileprivate func GenerateQuote() {
        let randomNumber = Int.random(in: 0 ..< 8)
        // Check the number by printing it
        print("Generated Number: ", randomNumber)
        
        // get the quote from array
        let randomQuote = Quotes[randomNumber]
        
        PersonImageView.image = UIImage(named: randomQuote.imageName)
        
        QuoteLabel.text = randomQuote.quote
        
        InspiredByLabel.text = randomQuote.inspireBy
    }
    
    @IBOutlet weak var InspireMeButton: UIButton!
    
    @IBAction func InspireMeButtonTap(_ sender: UIButton) {
        GenerateQuote()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
        // make curved image & button's borders
        PersonImageView.layer.borderWidth = 1
        PersonImageView.layer.masksToBounds = true
        PersonImageView.layer.borderColor = UIColor.black.cgColor
        PersonImageView.layer.cornerRadius = PersonImageView.frame.height/2
        PersonImageView.clipsToBounds = true
        InspireMeButton.layer.cornerRadius = InspireMeButton.frame.height / 2
        
        // array items
        
        let qoute1 = Quote(Quote: "“Don't cry because it's over, smile because it happened.”", InspireBy: "― Dr. Seuss", ImageName: "Suess")
        Quotes.append(qoute1)
        
        let quote2 = Quote(Quote: "“I'm selfish, impatient and a little insecure. I make mistakes, I am out of control and at times hard to handle. But if you can't handle me at my worst, then you sure as hell don't deserve me at my best.”", InspireBy: "- Marilyn Monroe", ImageName: "logo")
        Quotes.append(quote2)
        
        let quote3 = Quote(Quote: "“Two things are infinite: the universe and human stupidity; and I'm not sure about the universe.”", InspireBy: "- Albert Einstein", ImageName: "Einstein")
        Quotes.append(quote3)
        
        let quote4 = Quote(Quote: "“You've gotta dance like there's nobody watching, Love like you'll never be hurt, Sing like there's nobody listening, And live like it's heaven on earth.”", InspireBy: "- William W. Purkey", ImageName: "WillianPurkey")
        Quotes.append(quote4)
        
        let quote5 = Quote(Quote: "“Be the change that you wish to see in the world.”", InspireBy: "- Mahatma Gandhi", ImageName: "Gandhi")
        Quotes.append(quote5)
        
        let quote6 = Quote(Quote: "“Football, particularly Brazilian football, is about being happy, and that's what tricks do. It's part of our culture, at the end of the day, though, it's all about winning.”", InspireBy: "- Neymar", ImageName: "Neymar")
        Quotes.append(quote6)
        
        let quote7 = Quote(Quote: "“Sometimes life is too uncertain to have regrets.“", InspireBy: "- Goku", ImageName: "Goku")
        Quotes.append(quote7)
        
        let quote8 = Quote(Quote: "“Power comes in response to a need, not a desire.“", InspireBy: "- Goku", ImageName: "Goku")
        Quotes.append(quote8)
        
        GenerateQuote()
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
