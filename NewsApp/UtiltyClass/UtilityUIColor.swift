//
//  UtilityUIColor.swift
//  NewsApp
//
//  Created by Prashant Prajapati on 15/09/17.
//  Copyright © 2017 Prashant Prajapati. All rights reserved.
//

import UIKit

class UtilityUIColor: NSObject {
    
    func REDColor() -> UIColor {
        return UIColor.UIColorFromRGBHexValue(rgbValue: 0xFF0000)
    }
    
    func GREENColor() -> UIColor {
        return UIColor.UIColorFromRGBHexValue(rgbValue: 0x008000)
    }
    
    func BLUEColor() -> UIColor {
        return UIColor.UIColorFromRGBHexValue(rgbValue: 0x0000FF)
    }
}

extension UIColor{
    
    class func UIColorFromRGBHexValue(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func UIColorFromRGBHexValueWithAlpha(rgbValue: UInt, a: Float) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(a)
        )
    }
    
    class func UIColorFromRGBWithAlpha(red: Float, green: Float, blue: Float, a : Float) -> UIColor {
        return UIColor(red: CGFloat(Float(red) / 255.0),
                       green: CGFloat(Float(green) / 255.0),
                       blue: CGFloat(Float(blue) / 255.0),
                       alpha: CGFloat(a))
    }

}
