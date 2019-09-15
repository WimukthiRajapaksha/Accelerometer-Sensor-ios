//
//  ViewController.swift
//  Accelerometer Sensor
//
//  Created by Wimukthi Rajapaksha on 9/15/19.
//  Copyright © 2019 Wimukthi Rajapaksha. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    var sensor = CMMotionManager();
    
    @IBOutlet weak var readingX: UILabel!
    @IBOutlet weak var readingY: UILabel!
    @IBOutlet weak var readingZ: UILabel!
    
    @IBOutlet weak var lableX: UILabel!
    @IBOutlet weak var labelY: UILabel!
    @IBOutlet weak var labelZ: UILabel!
    
    var start = true
    
    @IBOutlet weak var startStopBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        readingX.alpha = 0
        readingY.alpha = 0
        readingZ.alpha = 0
        lableX.alpha = 0
        labelY.alpha = 0
        labelZ.alpha = 0
        sensor.startAccelerometerUpdates()
        startStopBtn.layer.cornerRadius = 0.5 * startStopBtn.bounds.size.width
        update()
    }
    
    func update() {
        sensor.accelerometerUpdateInterval = 0.2
        sensor.startAccelerometerUpdates(to: OperationQueue.current!) { (data, error) in
            if let trueData = data {
                print(trueData)
                self.view.reloadInputViews()
                self.readingX.text = "\(trueData.acceleration.x)"
                self.readingY.text = "\(trueData.acceleration.y)"
                self.readingZ.text = "\(trueData.acceleration.z)"
            }
        }
        
    }
    
    @IBAction func onStartStopClick(_ sender: Any) {
        if start {
            readingX.alpha = 1
            readingY.alpha = 1
            readingZ.alpha = 1
            lableX.alpha = 1
            labelY.alpha = 1
            labelZ.alpha = 1
            startStopBtn.setTitle("Stop", for: .normal)
            start = !start
        } else {
            readingX.alpha = 0
            readingY.alpha = 0
            readingZ.alpha = 0
            lableX.alpha = 0
            labelY.alpha = 0
            labelZ.alpha = 0
            startStopBtn.setTitle("Start", for: .normal)
            start = !start
        }
        
    }
    
}

