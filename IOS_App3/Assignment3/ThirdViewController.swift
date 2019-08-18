//
//  ThirdViewController.swift
//  Assignment3
//
//  Created by Student on 2019-08-13.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit
import AVFoundation

var songs:[String] = []
var audioPlayer = AVAudioPlayer()
var thisSong = 0
var audioStuffed = false

class ThirdViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var myTableView: UITableView!
    
    @IBAction func play(_ sender: Any) {
        
        if audioStuffed == true && audioPlayer.isPlaying == false{
            audioPlayer.play()
        }
    }
    @IBAction func next(_ sender: Any) {
        if audioStuffed == true && thisSong < songs.count - 1 {
            
            playThis(thisOne: songs[thisSong+1])
            
        }
    }
    @IBAction func pause(_ sender: Any) {
        if audioStuffed == true && audioPlayer.isPlaying {
            audioPlayer.pause()
        }
    }
    @IBAction func prev(_ sender: Any) {
        if audioStuffed == true && thisSong  != 0 {
            
            playThis(thisOne: songs[thisSong-1])
        }
    }
    func playThis(thisOne:String){
        do{
            
            let audioPath = Bundle.main.path(forResource: thisOne, ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            thisSong += 1
            audioPlayer.play()
            
            
        }
        catch{
            
            print("Error")
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = songs[indexPath.row]
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
        do{
            
           let audioPath = Bundle.main.path(forResource: songs[indexPath.row], ofType: ".mp3")
            
            print(songs[indexPath.row])
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
           audioPlayer.play()
            thisSong = indexPath.row
            audioStuffed = true
            
        }
        catch{
            
            print("Error")
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        gettingSongName()
    }
    
    func gettingSongName(){
        
        let folderURL = URL(fileURLWithPath: Bundle.main.resourcePath!)
        do{
            let songsPath = try FileManager.default.contentsOfDirectory(at: folderURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            for song in songsPath
            {
                var mySongs = song.absoluteString
                if mySongs.contains(".mp3"){
                    let findString = mySongs.components(separatedBy: "/")
                    mySongs = findString[findString.count-1]
                    mySongs = mySongs.replacingOccurrences(of: "%20", with: " ")
                     mySongs = mySongs.replacingOccurrences(of: "%5B", with: " ")
                     mySongs = mySongs.replacingOccurrences(of: "%5D", with: " ")
                   // print(mySongs)
                    mySongs = mySongs.replacingOccurrences(of: ".mp3", with: "")
                    songs.append(mySongs)
                  
                    
                }
            }
            
            myTableView.reloadData()
            
            
            
        }
        catch{
            
        }
    }

   
}
