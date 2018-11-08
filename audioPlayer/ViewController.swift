//
//  ViewController.swift
//  audioPlayer
//
//  Created by Iqbal Dwi Nur Khoirul anam on 31/10/18.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    var audioPlayer: AVAudioPlayer!
    
    func playSoundWith(fileName: String, fileExtension: String) -> Void {
        
        let audioSourchURL: URL!
        audioSourchURL = Bundle.main.url(forResource: fileName, withExtension: fileExtension)
        
        if audioSourchURL == nil {
            print("Requested song Cannot be Played")
        } else {
            
            
            do {
                audioPlayer = try AVAudioPlayer.init(contentsOf: audioSourchURL!)
                audioPlayer.prepareToPlay()
                audioPlayer.play()
                print ("playing the current Song \(fileName)")
                
                
            } catch {
                print(error)
            }
        }
    }
    

    @IBAction func playButton(_ sender: Any) {
        playSoundWith(fileName: "al-fatihah", fileExtension: "mp3")
    }
    
    
    @IBAction func pauseButton(_ sender: Any) {
        audioPlayer.pause()
        print("song Paused!")
    }
    
    
 
    @IBAction func resetButton(_ sender: Any) {
        audioPlayer.stop()
        audioPlayer.currentTime = 0
        print("stoped the the player.")
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }


}

