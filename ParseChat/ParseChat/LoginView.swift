//
//  LoginView.swift
//  ParseChat
//
//  Created by Enkhjargal Gansukh on 8/10/15.
//  Copyright (c) 2015 Enkhjargal Gansukh. All rights reserved.
//

import UIKit

class LoginView: UIViewController {
    
    var indicator: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0,0,150,150)) as UIActivityIndicatorView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("Login View is started")
        
        self.indicator.center = self.view.center
        self.indicator.hidesWhenStopped = true
        self.indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        view.addSubview(self.indicator)
    }
    override func viewDidAppear(animated: Bool) {
        println("Login View is already started")
        super.viewDidAppear(animated)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillDisappear(animated: Bool) {
        println("LoginView is gone")
        self.indicator.stopAnimating()
    }
    @IBAction func facebookLoginClicked(sender: AnyObject) {
        self.indicator.startAnimating()
        LoginService.sharedInstance.loginWithFacebook{
            response in
            if(response == true){
                let mainView:MainView = self.storyboard!.instantiateViewControllerWithIdentifier("MainView") as! MainView
                self.presentViewController(mainView, animated: true, completion: nil)
            }else{
                let alertController = UIAlertController(title: "Alert", message:
                    "Failed! Please log in again!", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            }
            self.indicator.stopAnimating()
        }
    }
    
}