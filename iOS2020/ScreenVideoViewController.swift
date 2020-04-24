//
//  ScreenVideoViewController.swift
//  iOS2020
//
//  Created by Luis Angel Ortega on 21/04/20.
//  Copyright © 2020 Luis Angel Ortega. All rights reserved.
//

import UIKit

class ScreenVideoViewController: VideoSplashViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupVideoBackground()
        // Do any additional setup after loading the view.
    }
    
    func setupVideoBackground() {
       let url = URL(fileURLWithPath: Bundle.main.path(forResource: "/videoplayback", ofType: "mp4")!)
       // setup layout
       videoFrame = view.frame
       fillMode = .resizeAspectFill
       alwaysRepeat = true
       sound = false
       startTime = 2.0
       alpha = 0.8
       contentURL = url
       view.isUserInteractionEnabled = false
     }
    
}
