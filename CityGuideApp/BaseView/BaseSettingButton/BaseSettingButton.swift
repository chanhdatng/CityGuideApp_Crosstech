//
//  BaseSettingButton.swift
//  CityGuideApp
//
//  Created by Chanh Dat Ng on 8/24/19.
//  Copyright © 2019 Chanh Dat Ng. All rights reserved.
//

import UIKit
protocol BaseSettingButtonDelegate {
   func clickBtn(_ view: UIView,_ sender: UIButton)
}
@IBDesignable
class BaseSettingButton: UIView {

    @IBOutlet weak var vContainer: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imvIcon: UIImageView!
    @IBOutlet weak var imvNext: UIImageView!
    @IBOutlet weak var btnTap: UIButton!

    var dele: BaseSettingButtonDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.defaultInit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.defaultInit()
    }
    
    func defaultInit() {
        let bundle = Bundle(for: BaseSettingButton.self)
        bundle.loadNibNamed("BaseSettingButton", owner: self, options: nil)
        self.vContainer.fixInView(self)
    }
    
    @IBAction func onBtn(_ sender: UIButton) {
        self.dele?.clickBtn(self, btnTap)
    }
    
    
}
