//
//  BaseNavigationBar.swift
//  CityGuideApp
//
//  Created by Trương Quốc Tài on 8/15/19.
//  Copyright © 2019 Chanh Dat Ng. All rights reserved.
//

import UIKit

protocol BaseNavigationBarDelegate {
    func touchBtnLeft()
    func touchBtnRight()
}
class BaseNavigationBar: UIView {
    var delegate: BaseNavigationBarDelegate?
    @IBOutlet var vContainer: UIView!
    @IBOutlet weak var btnLeft: UIButton!
    @IBOutlet weak var btnRight: UIButton!
    @IBOutlet weak var lblMid: UILabel!
    @IBAction func onBtnLeft(_ sender: UIButton) {
        self.delegate?.touchBtnLeft()
    }
    @IBAction func onBtnRight(_ sender: UIButton) {
        self.delegate?.touchBtnRight()
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
        let bundle = Bundle(for: BaseNavigationBar.self)
        bundle.loadNibNamed("BaseNavigationBar", owner: self, options: nil)
        self.vContainer.fixInView(self)
    }


}
