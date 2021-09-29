//
//  ViewController.swift
//  MotionCube
//
//  Created by User on 28.09.2021.
//

import UIKit

class ViewController: UIViewController {

    var animator: UIDynamicAnimator!
    var arrayBox: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayBox = [UIView]()
        animator = UIDynamicAnimator(referenceView: view)
    }

    
    @IBAction func showMoreActions(touch: UITapGestureRecognizer) {

        let touchPoint = touch.location(in: self.view)

        RandomUIV(touchPoint.x, touchPoint.y, self, animator)
        
    }
    
}

