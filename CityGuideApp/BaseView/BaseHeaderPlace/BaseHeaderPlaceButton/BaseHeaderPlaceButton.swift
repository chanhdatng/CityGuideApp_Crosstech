//
//  BaseHeaderPlaceButton.swift
//  CityGuideApp
//
//  Created by Trương Quốc Tài on 8/19/19.
//  Copyright © 2019 Chanh Dat Ng. All rights reserved.
//

import UIKit
protocol BaseHeaderPlaceButtonDelegate {
    func touchButton(_ view: UIView, _ sender: UIButton)
}
class BaseHeaderPlaceButton: UIView {
    
    @IBOutlet weak var vContainer: UIView!
    @IBOutlet weak var imvButton: UIImageView!
    @IBOutlet weak var btnButton: UIButton!
    var delegate: BaseHeaderPlaceButtonDelegate?
    
    @IBAction func onBtnButton(_ sender: Any) {
        self.delegate?.touchButton(self, btnButton)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.defaultInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.defaultInit()
    }
    
    func defaultInit() {
        let bundle = Bundle(for: BaseHeaderPlaceButton.self)
        bundle.loadNibNamed("BaseHeaderPlaceButton", owner: self, options: nil)
        self.vContainer.fixInView(self)
        
    }
    
}
