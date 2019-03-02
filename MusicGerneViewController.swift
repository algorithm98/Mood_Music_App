//
//  MusicGerneViewController.swift
//  Music_App
//
//  Created by Prince Prakalp on 01/03/19.
//  Copyright © 2019 Prince Prakalp. All rights reserved.
//

import UIKit
import MediaPlayer


class MusicGerneViewController: UIViewController {

    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func GenreBtnTapped(_ sender: UIButton) {
        
        MPMediaLibrary.requestAuthorization{ (status) in
            if status == .authorized{
        self.PlayGenre(genre: sender.currentTitle!)
            }
        }
    }
    
    @IBAction func StopBtmTapped(_ sender: UIButton) {
        
        musicPlayer.stop()
    }
    
    @IBAction func NextBtmTapped(_ sender: UIButton) {
        
        musicPlayer.skipToNextItem()
    }
    
    
    func PlayGenre(genre: String) {
        
        musicPlayer.stop()
        
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
        
        query.addFilterPredicate(predicate)
        
        musicPlayer.setQueue(with: query)
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
    }
}
