//
//  CanvasViewController.swift
//  canvas
//
//  Created by Stacey Gennoy on 11/9/15.
//  Copyright © 2015 Stacey Gennoy. All rights reserved.
//

import UIKit

class CanvasViewController: UIViewController {

    @IBOutlet weak var trayView: UIView!
    
    
    //create a "global" variable to store the original center of the trayView
    var trayOriginalCenter: CGPoint!
    
    var trayDownOffset: CGFloat!
    var trayUp: CGPoint!
    var trayDown: CGPoint!
    
    var newlyCreatedFace: UIImageView!
    var newlyCreatedFaceOriginalCenter: CGPoint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        trayDownOffset = 160
        trayUp = trayView.center
        trayDown = CGPoint(x: trayView.center.x ,y: trayView.center.y + trayDownOffset)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTrayPanGesture(sender: UIPanGestureRecognizer) {
        let velocity = sender.velocityInView(view)
        let translation = sender.translationInView(view)
        
        
        if sender.state == UIGestureRecognizerState.Began {
            trayOriginalCenter = trayView.center
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            // only move the tray if the new center is greater than or equal to 464
            if (trayOriginalCenter.y + translation.y >= 464) {
                trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + translation.y)
            }
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            print("Gesture ended with velocity: \(velocity)")
            if (velocity.y > 0) {
                // if velocity if positive the user was moving it down
                UIView.animateWithDuration(0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] , animations: { () -> Void in
                    self.trayView.center = self.trayDown
                    }, completion: { (Bool) -> Void in
                })
                
            } else if (velocity.y < 0){
                // else the velocity was negative the user was moving it up
                UIView.animateWithDuration(0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] , animations: { () -> Void in
                    self.trayView.center = self.trayUp
                    }, completion: { (Bool) -> Void in
                })
                
            }
        }
        // add code to pan when the tray is panned
        
    }
    
    @IBAction func didPanFace(sender: UIPanGestureRecognizer) {
        let translation = sender.translationInView(view)
        
        
        if sender.state == UIGestureRecognizerState.Began {
            print("Face began")
            let imageView = sender.view as! UIImageView
            newlyCreatedFace = UIImageView(image: imageView.image)
            view.addSubview(newlyCreatedFace)
            newlyCreatedFace.center = imageView.center
            newlyCreatedFace.center.y += trayView.frame.origin.y
            
            //setting original position, beginning position
            newlyCreatedFaceOriginalCenter = newlyCreatedFace.center
            
            newlyCreatedFace.transform = CGAffineTransformMakeScale(1.5, 1.5)
           
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            print("Face changed")
            // pan the postion to the newly created state
            newlyCreatedFace.center = CGPoint(x: newlyCreatedFaceOriginalCenter.x + translation.x, y: newlyCreatedFaceOriginalCenter.y + translation.y)


            
        } else if sender.state == UIGestureRecognizerState.Ended {
            print("Face ended")
            newlyCreatedFace.transform = CGAffineTransformMakeScale(1, 1)
        }

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
