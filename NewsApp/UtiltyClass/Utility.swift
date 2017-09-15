//
//  Utility.swift
//  NewsApp
//
//  Created by Prashant Prajapati on 15/09/17.
//  Copyright © 2017 Prashant Prajapati. All rights reserved.
//

import UIKit

class Utility: NSObject {
    var sharedInstance = Utility()
    
//    func getJSONDataFromdic(dic: [NSObject : AnyObject]) -> [NSObject : AnyObject] {
//        let error: NSError?
//        let jsonData = try! JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
//        var jsonString: String
//        if !jsonData {
//            print("Got an error: \(String(describing: error))")
//        }
//        else {
//            jsonString = String(data: jsonData, encoding: String.Encoding.utf8)!
//        }
//        let json_dict = (jsonString as! [NSObject : AnyObject])
//        return json_dict
//    }
    // MARK: User Default save
    func saveUserdefault(_ filename: String, arrayObject: Any) {
        let temparray: [Any]? = (arrayObject as? [Any])
        let documentsDir: String = NSHomeDirectory() + filename
        let dogFilePath: String = URL(fileURLWithPath: documentsDir).appendingPathComponent(filename).absoluteString
        NSKeyedArchiver.archiveRootObject(temparray!, toFile: dogFilePath)
    }
    
    func getUserdefault(_ filename: String) -> Any {
        let documentsDir: String = NSHomeDirectory() + filename
        let dogFilePath: String = URL(fileURLWithPath: documentsDir).appendingPathComponent(filename).absoluteString
        return NSKeyedUnarchiver.unarchiveObject(withFile: dogFilePath)!
    }
    
    // MARK: Email Validation
    func validateEmail(with email: String) -> Bool {
        let emailRegex: String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: email)
    }
    
    func getTimestamp(date: NSDate) -> Int {
        return Int(date.timeIntervalSince1970)
    }
    
    func isStringNull(string: String) -> Bool {
        if string == (NSNull() as AnyObject) as! String || string.characters.count == 0 || (string == "") || (string == "<null>") || (string == "(null)") {
            return true
        }
        return false
    }
    
    
}
