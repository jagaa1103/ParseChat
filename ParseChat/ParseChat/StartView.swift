//
//  StartView.swift
//  ParseChat
//
//  Created by Enkhjargal Gansukh on 8/12/15.
//  Copyright (c) 2015 Enkhjargal Gansukh. All rights reserved.
//

import UIKit

class StartView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    @IBAction func startClicked(sender: AnyObject) {
        checkLogin()
    }
    
    func checkLogin(){
        if(LoginService.sharedInstance.checkLogin() == true){
            let mainView:MainView = self.storyboard!.instantiateViewControllerWithIdentifier("MainView") as! MainView
            self.presentViewController(mainView, animated: true, completion: nil)
        }else{
            let loginView:LoginView = self.storyboard!.instantiateViewControllerWithIdentifier("LoginView") as! LoginView
            self.presentViewController(loginView, animated: true, completion: nil)
        }
    }
}