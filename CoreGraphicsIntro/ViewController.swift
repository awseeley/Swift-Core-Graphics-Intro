//
//  ViewController.swift
//  CoreGraphicsIntro
//
//  Created by Andrew Seeley on 6/2/17.
//  Copyright © 2017 Seemu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let squarePath = UIBezierPath() // 1
        squarePath.move(to: CGPoint(x: 100, y: 100)) // 2
        // 3 & 4
        squarePath.addLine(to: CGPoint(x: 200, y: 100))
        squarePath.addLine(to: CGPoint(x: 200, y: 200))
        squarePath.addLine(to: CGPoint(x: 100, y: 200))
        
        squarePath.close() // 5
        
        
        let square = CAShapeLayer() // 6
        square.path = squarePath.cgPath // 7 Apply the squarePath to our layer
        square.fillColor = UIColor.red.cgColor // 8 Fill it with red
        self.view.layer.addSublayer(square) // 9 Add it to our view
        
        let circle = CAShapeLayer()
        circle.path = circlePathWithCenter(center: CGPoint(x: 200,y: 400), radius: 50).cgPath
        circle.fillColor = UIColor.blue.cgColor
        self.view.layer.addSublayer(circle)
        
        
    }
    
    func circlePathWithCenter(center: CGPoint, radius: CGFloat) -> UIBezierPath {
        let circlePath = UIBezierPath()
        circlePath.addArc(withCenter: center, radius: radius, startAngle: -CGFloat(M_PI), endAngle: -CGFloat(M_PI/2), clockwise: true)
        circlePath.addArc(withCenter: center, radius: radius, startAngle: -CGFloat(M_PI/2), endAngle: 0, clockwise: true)
        circlePath.addArc(withCenter: center, radius: radius, startAngle: 0, endAngle: CGFloat(M_PI/2), clockwise: true)
        circlePath.addArc(withCenter: center, radius: radius, startAngle: CGFloat(M_PI/2), endAngle: CGFloat(M_PI), clockwise: true)
        circlePath.close()
        return circlePath
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

