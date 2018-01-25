//
//  ViewController.swift
//  Animations
//
//  Created by Hafeez Khan on 2017-08-01.
//  Copyright © 2017 Hafeez Khan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var redBox : UIView!
    var redBoxOriginalFrame : CGRect!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
         redBox.center = CGPoint (x: view.frame.size.width/2, y: view.frame.size.height/2)
        
    }
    
    @IBAction func viewPinched(_sender: UIPinchGestureRecognizer) {
        
        switch _sender.state {
        case .began:
            redBoxOriginalFrame = redBox.frame
        case .changed:
            let scale = _sender.scale
            let side = redBoxOriginalFrame.size.width * scale
           
            redBox.frame.size = CGSize (width: side, height: side)
            redBox.center = CGPoint (x: view.frame.size.width/2, y: view.frame.size.height/2)
            
            
            
        default:
            break
        }
        
        
    }

    @IBAction func viewPanned(_ sender: UIPanGestureRecognizer) {
        
       // print (sender.translation(in: view))
        switch sender.state {
        case .began:
            redBoxOriginalFrame = redBox.frame
        case.changed:
            let delta = sender.translation(in: view)
            redBox.frame = CGRect(x: redBoxOriginalFrame.origin.x + delta.x, y: redBoxOriginalFrame.origin.y + delta.y, width: redBox.frame.size.width, height: redBox.frame.size.height)
        case.ended:
            UIView.animate(withDuration: 0.5, animations: {
                self.redBox.frame = self.redBoxOriginalFrame
            })
        default: break
        
        }
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

