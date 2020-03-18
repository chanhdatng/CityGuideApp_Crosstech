//
//  BaseButtonMenu.swift
//  CityGuideApp
//
//  Created by Trương Quốc Tài on 8/19/19.
//  Copyright © 2019 Chanh Dat Ng. All rights reserved.
//

import UIKit
protocol BaseButtonMenuDelegate {
    func clickMenuButton(_ view: UIView, _ sender: UIButton)
}
class BaseButtonMenu: UIView {

    @IBOutlet weak var vContainer: UIView!
    @IBOutlet weak var btnImage: UIButton!

    var dele: BaseButtonMenuDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.defaultInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.defaultInit()
    }
    
    func defaultInit() {
        let bundle = Bundle(for: BaseButtonMenu.self)
        bundle.loadNibNamed("BaseButtonMenu", owner: self, options: nil)
        self.vContainer.fixInView(self)
    }
    
    func setHome() {
        self.btnImage.setImage(UIImage(named: "ico_home"), for: .normal)
    }
    func selectedHome() {
        self.btnImage.setImage(UIImage(named: "ico_home_selected"), for: .normal)
    }
    
    func setMap() {
        self.btnImage.setImage(UIImage(named: "ico_map"), for: .normal)
    }
    func selectedMap() {
        self.btnImage.setImage(UIImage(named: "ico_map_selected"), for: .normal)
    }
    
    func setUser() {
        self.btnImage.setImage(UIImage(named: "ico_user"), for: .normal)
    }
    func selectedUser() {
        self.btnImage.setImage(UIImage(named: "ico_user_selected"), for: .normal)
    }

    func setSetting() {
        self.btnImage.setImage(UIImage(named: "ico_setting"), for: .normal)
    }
    func selectedSetting() {
        self.btnImage.setImage(UIImage(named: "ico_setting_selected"), for: .normal)
    }
    
    @IBAction func onBtn(_ sender: UIButton) {
        self.dele?.clickMenuButton(self,btnImage)
    }

}
