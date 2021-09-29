//
//  RandomUIV.swift
//  MotionCube
//
//  Created by User on 28.09.2021.
//

import UIKit

class RandomUIV: UIView {
    
    @IBOutlet var PanGestureRecognizer: UIPanGestureRecognizer!
    @IBOutlet var PinchGestureRecognizer: UIPinchGestureRecognizer!
    @IBOutlet var RotationGesture: UIRotationGestureRecognizer!
    var daddy: UIViewController!
    var animator: UIDynamicAnimator!
    
    var collision: UICollisionBehavior!
    var gravity: UIGravityBehavior!
    var itemBehavior: UIDynamicItemBehavior!
    
    
    init(_ x: CGFloat, _ y: CGFloat, _ daddy: ViewController, _ animator: UIDynamicAnimator){
        self.daddy = daddy
        self.animator = animator
        let size = Float.random(in: 20...100)
        super.init(frame: CGRect(x: x-CGFloat(size/2), y: y-CGFloat(size/2), width: CGFloat(size), height: CGFloat(size)))
        isUserInteractionEnabled = true
        backgroundColor=UIColor(red: CGFloat(Float.random(in: 0...1)),
                                green: CGFloat(Float.random(in: 0...1)),
                                blue: CGFloat(Float.random(in: 0...1)),
                                alpha: CGFloat(Float.random(in: 0...1)))
        layer.cornerRadius = CGFloat([0, size/2].randomElement()!)
        layer.borderWidth = 0
        let mySelector = #selector(self.handlePan(_:))
        PanGestureRecognizer = UIPanGestureRecognizer(target: self, action: mySelector)
        PinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: mySelector)
        RotationGesture = UIRotationGestureRecognizer(target: self, action: mySelector)
        
        self.addGestureRecognizer(PanGestureRecognizer)
        self.addGestureRecognizer(PinchGestureRecognizer)
        self.addGestureRecognizer(RotationGesture)
        
        
        daddy.view.addSubview(self)
        daddy.arrayBox.append(self)
        
        itemBehavior = UIDynamicItemBehavior(items: [self])
        itemBehavior.angularResistance = 0.5
        itemBehavior.density = 10
        itemBehavior.elasticity = 0.2
        itemBehavior.friction = 0.3
        itemBehavior.resistance = 0.3
        animator.addBehavior(itemBehavior)
        gravity = UIGravityBehavior(items: [self])
        animator.addBehavior(gravity)
        collision = UICollisionBehavior(items: daddy.arrayBox)
        collision.collisionMode = UICollisionBehavior.Mode.everything
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBAction func handlePan(_ recognizer: UIPanGestureRecognizer) {
        if recognizer.state == UIGestureRecognizer.State.began
        {
            animator.removeBehavior(itemBehavior)
            animator.removeBehavior(gravity)
            animator.removeBehavior(collision)
        }
        let translation = recognizer.translation(in:daddy.view)
        if let view = recognizer.view {
        view.center = CGPoint(x:view.center.x + translation.x,
                                y:view.center.y + translation.y)
        }
        recognizer.setTranslation(CGPoint.zero, in: daddy.view)
        if recognizer.state == .ended
        {
            animator.addBehavior(itemBehavior)
            animator.addBehavior(gravity)
            animator.addBehavior(collision)
        }
    }

}
