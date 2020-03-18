//
//  BaseMenu.swift
//  CityGuideApp
//
//  Created by Trương Quốc Tài on 8/19/19.
//  Copyright © 2019 Chanh Dat Ng. All rights reserved.
//

import UIKit

class BaseMenu: UIView,BaseButtonMenuDelegate {
    func clickMenuButton(_ view: UIView, _ sender: UIButton) {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        if view == bMap{
            let vc = Utilities.share.createVCwith(nameStoryboard.nameSB, nameVC.CityVC)
            delegate.nvc.pushViewController(vc, animated: true)
        }
        if view == bHome{
            let vc = Utilities.share.createVCwith(nameStoryboard.nameSB, nameVC.HomeVC)
            delegate.nvc.pushViewController(vc, animated: true)
        }
        if view == bUser{
            let vc = Utilities.share.createVCwith(nameStoryboard.nameSB, nameVC.UserVC)
            delegate.nvc.pushViewController(vc, animated: true)
        }
        if view == bSetting{
            let vc = Utilities.share.createVCwith(nameStoryboard.nameSB, nameVC.SettingVC)
            delegate.nvc.pushViewController(vc, animated: true)
        }
    }
    

    @IBOutlet weak var vContainer: UIView!
    @IBOutlet weak var stvMenu: UIStackView!
    @IBOutlet weak var bHome: BaseButtonMenu!
    @IBOutlet weak var bMap: BaseButtonMenu!
    @IBOutlet weak var bUser: BaseButtonMenu!
    @IBOutlet weak var bSetting: BaseButtonMenu!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.defaultInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.defaultInit()
    }
    
    func defaultInit() {
        let bundle = Bundle(for: BaseMenu.self)
        bundle.loadNibNamed("BaseMenu", owner: self, options: nil)
        self.vContainer.fixInView(self)
        self.bHome.setHome()
        self.bMap.setMap()
        self.bUser.setUser()
        self.bSetting.setSetting()

        self.bHome.dele = self
        self.bUser.dele = self
        self.bMap.dele = self
        self.bSetting.dele = self
    }

}
