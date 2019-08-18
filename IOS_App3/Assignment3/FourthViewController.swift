//
//  FourthViewController.swift
//  Assignment3
//
//  Created by Student on 2019-08-13.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit
import AVFoundation
class FourthViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    
//
//
//    @IBAction func play(_ sender: Any) {
//
//        if audioStuffed == true && audioPlayer.isPlaying == false{
//            audioPlayer.play()
//        }
//    }
//
//    @IBAction func pause(_ sender: Any) {
//
//        if audioStuffed == true && audioPlayer.isPlaying {
//            audioPlayer.pause()
//        }
//    }
//
//
//    @IBAction func prev(_ sender: Any) {
//
//         if audioStuffed == true && thisSong  != 0 {
//
//            playThis(thisOne: songs[thisSong-1])
//        }
//    }
//
//
//    @IBAction func next(_ sender: Any) {
//
//        if audioStuffed == true && thisSong < songs.count - 1 {
//
//            playThis(thisOne: songs[thisSong+1])
//
//        } else {
//
//
//
//        }
//
//    }
//
//
//
//    @IBAction func slider(_ sender: Any) {
//        if audioStuffed == true{
//
//            audioPlayer.volume = (sender as AnyObject).value
//        }
//
//
//    }
//
//    func playThis(thisOne:String){
//        do{
//
//            let audioPath = Bundle.main.path(forResource: thisOne, ofType: ".mp3")
//            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
//            thisSong += 1
//            audioPlayer.play()
//
//
//        }
//        catch{
//
//            print("Error")
//
//        }
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
