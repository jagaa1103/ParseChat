//
//  LoginService.swift
//  ParseChat
//
//  Created by Enkhjargal Gansukh on 8/12/15.
//  Copyright (c) 2015 Enkhjargal Gansukh. All rights reserved.
//

import Foundation
import Parse

class LoginService {
    
    class var sharedInstance: LoginService {
        struct Static {
            static var instance: LoginService?
        }
        if (Static.instance == nil) {
            Static.instance = LoginService()
        }
        return Static.instance!
    }

    
    func checkLogin()->Bool{
        if(PFUser.currentUser() != nil){
            return true
        }else{
            return false
        }
    }
    
    
    func loginWithFacebook(completionHandler:(res:Bool)->()){
        var flag: Bool = false
        PFFacebookUtils.logInInBackgroundWithReadPermissions(["email", "public_profile"], block:{
            (user: PFUser?, error: NSError?) -> Void in
            if(error != nil){
                println("Error: \(error)")
            }
            if let user = user {
                if user.isNew {
                    println("User signed up and logged in through Facebook!")
                } else {
                    println("User logged in through Facebook!")
                }
                completionHandler(res: true)
            } else {
                println("Uh oh. The user cancelled the Facebook login.")
                completionHandler(res: false)
            }
        })
    }
    
}