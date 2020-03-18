//
//  BaseHeaderUser.swift
//  CityGuideApp
//
//  Created by Chanh Dat Ng on 8/16/19.
//  Copyright © 2019 Chanh Dat Ng. All rights reserved.
//

import UIKit

protocol BaseHeaderUserDelegate {
    func clickBtnChangeAva()
}
class BaseHeaderUser: UIView {

    // MARK: - Variable
    @IBOutlet weak var vContainer: UIView!
    @IBOutlet weak var vBG: UIView!
    @IBOutlet weak var vAva: UIView!
    @IBOutlet weak var imvAva: UIImageView!
    @IBOutlet weak var btnChangeAva: UIButton!
    
    var dele: BaseHeaderUserDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.defaultInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.defaultInit()
    }
    
    func defaultInit() {
        let bundle = Bundle(for: BaseHeaderUser.self)
        bundle.loadNibNamed("BaseHeaderUser", owner: self, options: nil)
        self.vContainer.fixInView(self)
        self.imvAva.layer.cornerRadius = self.self.imvAva.frame.width/2
        self.vAva.backgroundColor = UIColor.clear
//        self.vContainer.backgroundColor = UIColor.clear
        self.vBG.layer.masksToBounds = false
        self.vBG.layer.cornerRadius = 60
    }
    @IBAction func onBtnChangeAva(_ sender: UIButton) {
        self.dele?.clickBtnChangeAva()
    }
}
