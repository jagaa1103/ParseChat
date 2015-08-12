//
//  LoginView.swift
//  ParseChat
//
//  Created by Enkhjargal Gansukh on 8/10/15.
//  Copyright (c) 2015 Enkhjargal Gansukh. All rights reserved.
//

import UIKit

class LoginView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("Login View is started")
    }
    override func viewDidAppear(animated: Bool) {
        println("Login View is already started")
        super.viewDidAppear(animated)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func facebookLoginClicked(sender: AnyObject) {
        
    }
    
}