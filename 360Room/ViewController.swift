//
//  ViewController.swift
//  360Room
//
//  Created by iD Student on 7/12/16.
//  Copyright © 2016 NellSteinmetz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var roomView: UIView!
    var length = 0
    var width = 0


    @IBOutlet weak var bed1Button: UIButton!
    @IBOutlet weak var bed3Button: UIButton!
    @IBOutlet weak var bed2Button: UIButton!
    @IBOutlet weak var bedButton: UIButton!
//    var lastRotation = CGFloat()
//    let rotateRec = UIRotationGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        rotateRec.addTarget(self, action: "rotatedView:")
//        view.addGestureRecognizer(rotateRec)
//        view.userInteractionEnabled = true
//        view.multipleTouchEnabled = true
    }
    
    override func viewDidAppear(animated: Bool) {
        displayPopUp(true)
    }
//    func rotatedView(sender:UIRotationGestureRecognizer) {
//        var lastRotation = CGFloat ()
//        self.view.bringSubviewToFront(view)
//        if (sender.state == UIGestureRecognizerState.ended){
//            lastRotation = 0.0;
//        }
//        rotation = 0.0 - (lastRotation - sender.rotation)
//        var point = rotateRec.locationInView(view)
//        var currentTrans = sender.view?.transform
//        var newTrans = CGAffineTransformRotate(currentTrans, rotation)
//        sender.view.transform = newTrans
//        lastRotation = sender.rotation
//    }
    
    func displayPopUp(firstTime: Bool) {
        
        var msg = ""
        if firstTime == true {
            msg = "Insert your room dimensions!"
        } else {
            msg = "Please only use numbers for your dimensions"
        }
        
        
        let controller = UIAlertController (title: "Dimensions", message: msg, preferredStyle: UIAlertControllerStyle.Alert)
        
        controller.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "width"
        }
        
        controller.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "length"
        }
        
        let goButton = UIAlertAction (title: "GO!", style: UIAlertActionStyle.Default) { (action) -> Void in
            
            let widthField: UITextField = (controller.textFields?.first)!
            let lengthField: UITextField = (controller.textFields?.last)!
            let length = Int(lengthField.text!)
            let width = Int(widthField.text!)
            
            if length == nil || width == nil {
                self.displayPopUp(false)
            } else {
            }
            
            print(self.length, self.width)
        }
        controller.addAction(goButton)
        presentViewController(controller, animated: true, completion: nil)
    }

    func drag (buttn: UIButton, event: UIEvent ) {
        var touch: UITouch = (event.touchesForView(buttn)?.first)!
        var previousLocation: CGPoint = touch.previousLocationInView(buttn)
        var location: CGPoint = touch.locationInView(buttn)
        var delta_x: CGFloat = location.x - previousLocation.x
        var delta_y: CGFloat = location.y - previousLocation.y
//        buttn.constraintsAffectingLayoutForAxis(roomView)
        buttn.center = CGPointMake(buttn.center.x + delta_x, buttn.center.y + delta_y);
    }
    
    @IBAction func bed1Tapped(sender: UIButton) {
        let button = UIButton(type: UIButtonType.Custom)
        let img = UIImage(named: "bed1")
        button.setImage(img, forState: UIControlState.Normal)
        button.setImage(img, forState: UIControlState.Selected)
        button.contentMode = .ScaleAspectFit
        button.imageView?.contentMode = .ScaleAspectFit
        button.frame = CGRectMake(0, 0, 107, 107)
        roomView.addSubview(button)
        button.addTarget(self, action: "drag:event:", forControlEvents: UIControlEvents.TouchDragInside)
    }
    @IBAction func bed3Tapped(sender: AnyObject) {
        let button = UIButton(type: UIButtonType.Custom)
        let img = UIImage(named: "bed3")
        button.setImage(img, forState: UIControlState.Normal)
        button.setImage(img, forState: UIControlState.Selected)
        button.contentMode = .ScaleAspectFit
        button.imageView?.contentMode = .ScaleAspectFit
        button.frame = CGRectMake(0, 0, 107, 107)
        roomView.addSubview(button)
        button.addTarget(self, action: "drag:event:", forControlEvents: UIControlEvents.TouchDragInside)
    }
    @IBAction func bed2Tapped(sender: AnyObject) {
        let button = UIButton(type: UIButtonType.Custom)
        let img = UIImage(named: "bed2")
        button.setImage(img, forState: UIControlState.Normal)
        button.setImage(img, forState: UIControlState.Selected)
        button.contentMode = .ScaleAspectFit
        button.imageView?.contentMode = .ScaleAspectFit
        button.frame = CGRectMake(0, 0, 107, 107)
        roomView.addSubview(button)
        button.addTarget(self, action: "drag:event:", forControlEvents: UIControlEvents.TouchDragInside)
    }
    @IBAction func bedTapped(sender: AnyObject) {
        let button = UIButton(type: UIButtonType.Custom)
        let img = UIImage(named: "bed")
        button.setImage(img, forState: UIControlState.Normal)
        button.setImage(img, forState: UIControlState.Selected)
        button.contentMode = .ScaleAspectFit
        button.imageView?.contentMode = .ScaleAspectFit
        button.frame = CGRectMake(0, 0, 107, 107)
        roomView.addSubview(button)
        button.addTarget(self, action: "drag:event:", forControlEvents: UIControlEvents.TouchDragInside)
    }
    
}

