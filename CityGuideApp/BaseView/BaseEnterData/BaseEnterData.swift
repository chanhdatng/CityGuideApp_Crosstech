//
//  BaseEnterData.swift
//  CityGuideApp
//
//  Created by Chanh Dat Ng on 8/9/19.
//  Copyright © 2019 Chanh Dat Ng. All rights reserved.
//

import UIKit

class BaseEnterData: UIView, UITextFieldDelegate {

    @IBOutlet weak var vContainer: UIView!
    @IBOutlet weak var txfEnterData: UITextField!
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.defaultInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.defaultInit()
    }
    
    func defaultInit() {
        let bundle = Bundle(for: BaseEnterData.self)
        bundle.loadNibNamed("BaseEnterData", owner: self, options: nil)
        self.vContainer.fixInView(self)
        self.txfEnterData.delegate = self
        //        self.tfData.becomeFirstResponder()
        //        self.tfData.resignFirstResponder()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func setPlaceholder(_ str : String){
        self.txfEnterData.placeholder = str
    }
    
    func setCornerRadious(_ cr: CGFloat){
        self.vContainer.layer.cornerRadius = cr
    }
    func setBGColor(_ color: UIColor){
        self.vContainer.backgroundColor = color
    }
    
}

extension UIView {
    func fixInView(_ container: UIView!) -> Void {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.frame = container.frame
        container.addSubview(self)
        
        NSLayoutConstraint.init(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint.init(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint.init(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint.init(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    }
}
