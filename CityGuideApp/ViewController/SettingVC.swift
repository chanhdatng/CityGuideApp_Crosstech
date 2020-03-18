//
//  SettingVC.swift
//  CityGuideApp
//
//  Created by Trương Quốc Tài on 8/15/19.
//  Copyright © 2019 Chanh Dat Ng. All rights reserved.
//

import UIKit

class SettingVC: UIViewController, BaseSettingButtonDelegate {
    func clickBtn(_ view: UIView, _ sender: UIButton) {
        if (view == self.bLogOut)
        {
            showSimpleAlert()
        }
    }
    
    
    @IBOutlet weak var bMenu: BaseMenu!
    @IBOutlet weak var vContainer: UIView!
    @IBOutlet weak var bPrivacy: BaseSettingButton!
    @IBOutlet weak var bNotification: BaseSettingButton!
    @IBOutlet weak var bFeedback: BaseSettingButton!
    @IBOutlet weak var bLanguage: BaseSettingButton!
    @IBOutlet weak var bSetTime: BaseSettingButton!
    @IBOutlet weak var bLogOut: BaseSettingButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bMenu.bSetting.selectedSetting()
        self.bLogOut.dele = self
        
        
        // Do any additional setup after loading the view.
    }
    /**
     Simple Alert
     - Show alert with title and alert message and basic two actions
     */
    func showSimpleAlert() {
        let alert = UIAlertController(title: "Sign out?", message: "You can always access your content by signing back in",         preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: { _ in
            return
        }))
        alert.addAction(UIAlertAction(title: "Sign out", style: UIAlertAction.Style.default, handler: {(_: UIAlertAction!) in
            let vc = Utilities.share.createVCwith(nameStoryboard.nameSB, nameVC.LoginVC) as! LoginVC
            self.navigationController?.pushViewController(vc, animated: true)
                                        //Sign out action
                                        
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
