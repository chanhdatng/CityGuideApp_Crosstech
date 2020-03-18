//
//  Extensions.swift
//  CityGuideApp
//
//  Created by Chanh Dat Ng on 8/23/19.
//  Copyright © 2019 Chanh Dat Ng. All rights reserved.
//

import Foundation
import UIKit

//@IBDesignable
//class DesignableView: UIView {
//}
//
//@IBDesignable
//class DesignableButton: UIButton {
//}
//
//@IBDesignable
//class DesignableLabel: UILabel {
//}

extension UICollectionViewCell {
    func createShadow(_ cell: UICollectionViewCell){
        
        cell.contentView.layer.cornerRadius = 12.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = true;
        
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOffset = CGSize(width:0,height: 2.0)
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false;
        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
    }
}

//extension UIView {
//    func setShadowUIView(_ radius: CGFloat){
//        self.layer.cornerRadius = 12.0
//        self.layer.borderWidth = 1.0
//        self.layer.borderColor = UIColor.clear.cgColor
//        self.layer.masksToBounds = true;
//
//        self.layer.masksToBounds = false
//        self.layer.shadowColor = UIColor.lightGray.cgColor
//        self.layer.shadowOffset = CGSize(width:0,height: 2.0)
//        self.layer.shadowOpacity = 1
//        self.layer.shadowRadius = radius
//        self.layer.shadowPath = UIBezierPath(roundedRect:self.bounds, cornerRadius:self.layer.cornerRadius).cgPath
//    }
//}

extension UIView {
    
    //    @IBInspectable
    //    var cornerRadius: CGFloat {
    //        get {
    //            return layer.cornerRadius
    //        }
    //        set {
    //            layer.cornerRadius = newValue
    //        }
    //    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}

//
//extension UITableView {
//
//    /**
//     Use it as a trick to remove the separator lines of blank cells at the bottom of tableView.
//     */
//    func removeBottomSeparatorLine() {
//        tableFooterView = UIView(frame: CGRect.zero)
//}
//}
