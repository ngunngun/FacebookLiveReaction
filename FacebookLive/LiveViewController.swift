//
//  LiveViewController.swift
//  FacebookLive
//
//  Created by ngunngun on 20/8/2561 BE.
//  Copyright © 2561 -. All rights reserved.
//

import UIKit

class LiveViewController: UIViewController {
    
    @IBOutlet weak var loveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loveButtonPressed(_ sender: UIButton) {
        let imgView = UIImageView(image: UIImage(named: "ic-fav"))
        let dimension = 20 + drand48() * 10
        imgView.frame = CGRect(x: 0, y: 0, width: dimension, height: dimension)
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = customPath().cgPath
        animation.duration = 2 + drand48() * 3
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        
        imgView.layer.add(animation, forKey: nil)
        view.addSubview(imgView)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + animation.duration) {
            imgView.removeFromSuperview()
        }
        
    }
    
    func customPath() -> UIBezierPath{
        let path = UIBezierPath()
        path.move(to: CGPoint(x: view.frame.width, y: view.frame.height))
        
        let endPoint = CGPoint(x: view.frame.width - 50, y: view.frame.height/2)
        
        let randomXShif = 100 + drand48() * 300
        
        let cp1 = CGPoint(x: (view.frame.width - 50) - CGFloat(randomXShif), y: view.frame.height/1.5)
        let cp2 = CGPoint(x: (view.frame.width - 200) + CGFloat(randomXShif), y: view.frame.height/1.5)
        
        path.addCurve(to: endPoint, controlPoint1: cp1, controlPoint2: cp2)
        return path
    }

}
