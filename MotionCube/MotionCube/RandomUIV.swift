//
//  RandomUIV.swift
//  MotionCube
//
//  Created by User on 28.09.2021.
//

import UIKit

class RandomUIV: UIView {

    init(_ x: CGFloat, _ y: CGFloat){
        super.init(frame: CGRect(x: x-50, y: y-50, width: 100, height: 100))
        backgroundColor=UIColor(red: CGFloat(Float.random(in: 0...1)),
                                green: CGFloat(Float.random(in: 0...1)),
                                blue: CGFloat(Float.random(in: 0...1)),
                                alpha: CGFloat(Float.random(in: 0...1)))
        layer.cornerRadius = [0, 50].randomElement()!
        layer.borderWidth=0
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
