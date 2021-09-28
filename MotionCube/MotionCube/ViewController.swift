//
//  ViewController.swift
//  MotionCube
//
//  Created by User on 28.09.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showMoreActions(touch: UITapGestureRecognizer) {

           let touchPoint = touch.location(in: self.view)
        let DynamicView = RandomUIV(touchPoint.x, touchPoint.y)
           self.view.addSubview(DynamicView)

    }
}

