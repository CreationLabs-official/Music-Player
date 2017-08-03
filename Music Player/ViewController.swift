//
//  ViewController.swift
//  Music Player
//
//  Created by Mustafa Yusuf on 04/08/17.
//  Copyright © 2017 Mustafa Yusuf. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		self.becomeFirstResponder() // To get shake gesture
	}
	
	// We are willing to become first responder to get shake motion
	override var canBecomeFirstResponder: Bool {
		get {
			return true
		}
	}
	
	// Enable detection of shake motion
	override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
		if motion == .motionShake {
			playSound()
		}
	}
	
	var player : AVAudioPlayer?
	
	func playSound(){
		let x = arc4random()%5
		let path = Bundle.main.path(forResource: "\(x)", ofType:"mp3")!
		let url = URL(fileURLWithPath: path)
		
		do {
			let sound = try AVAudioPlayer(contentsOf: url)
			self.player = sound
			sound.numberOfLoops = 1
			sound.prepareToPlay()
			sound.play()
		} catch {
			print("error loading file")
			// couldn't load file :(
		}
	}

	
}

