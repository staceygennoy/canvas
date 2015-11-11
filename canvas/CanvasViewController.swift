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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func onCustomTap(tapGestureRecognizer: UITapGestureRecognizer) {
        var point = tapGestureRecognizer.locationInView(view)
        
        // User tapped at the point above. Do something with that if you want.
    }

    @IBAction func onTrayPanGesture(sender: UIPanGestureRecognizer) {
        
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
