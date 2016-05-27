//
//  ViewController.swift
//  Siren
//
//  Created by 熊猫饼饼 on 5/26/16.
//  Copyright © 2016 foprc. All rights reserved.
//

import Cocoa
import AVFoundation

class ViewController: NSViewController {
    
    @IBOutlet weak var playButton: NSButton!
    var audioPlayer = AVAudioPlayer()
    
    var isPlaying = false

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("a", ofType: "mp3")!)
        do {
            try audioPlayer = AVAudioPlayer(contentsOfURL: url)
        } catch {
            print("Nothing I can do.")
        }
        audioPlayer.prepareToPlay()
        
        playButton.target = self;
        playButton.action = #selector(buttonClick)
    }
    
    func buttonClick(sender:NSButton) {
        if isPlaying {
            playButton.title = "Play"
            audioPlayer.pause()
        } else {
            playButton.title = "Pause"
            audioPlayer.play()
        }
        isPlaying = !isPlaying
        
        return
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

