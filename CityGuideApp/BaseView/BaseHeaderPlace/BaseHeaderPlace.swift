//
//  BaseHeaderPlace.swift
//  CityGuideApp
//
//  Created by Trương Quốc Tài on 8/19/19.
//  Copyright © 2019 Chanh Dat Ng. All rights reserved.
//

import UIKit

class BaseHeaderPlace: UIView, BaseHeaderPlaceButtonDelegate {
    func touchButton(_ view: UIView, _ sender: UIButton) {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        if(view == bBack){
            delegate.nvc.popViewController(animated: true)
        }
        if(view == bReview){
            self.showSimpleAlert("REVIEW", "Your review", "OK")
        }
    }
    
    @IBOutlet weak var vContainer: UIView!
    @IBOutlet weak var bBack: BaseHeaderPlaceButton!
    @IBOutlet weak var bCheckin: BaseHeaderPlaceButton!
    @IBOutlet weak var bReview: BaseHeaderPlaceButton!
    @IBOutlet weak var bPin: BaseHeaderPlaceButton!
    @IBOutlet weak var bShare: BaseHeaderPlaceButton!
    
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    var review: ReviewModal?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.defaultInit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.defaultInit()
    }
    
    func defaultInit() {
        let bundle = Bundle(for: BaseHeaderPlace.self)
        bundle.loadNibNamed("BaseHeaderPlace", owner: self, options: nil)
        self.vContainer.fixInView(self)
        
        self.bBack.imvButton.image = UIImage(named: "ico_back")
        self.bCheckin.imvButton.image = UIImage(named: "ico_checkin")
        self.bReview.imvButton.image = UIImage(named: "ico_review")
        self.bPin.imvButton.image = UIImage(named: "ico_pin")
        self.bShare.imvButton.image = UIImage(named: "ico_share")
        
        self.bBack.btnButton.setTitle("Back", for: .normal)
        self.bCheckin.btnButton.setTitle("Check-in", for: .normal)
        self.bReview.btnButton.setTitle("Review", for: .normal)
        self.bPin.btnButton.setTitle("Pin", for: .normal)
        self.bShare.btnButton.setTitle("Share", for: .normal)
        
        self.bBack.delegate = self
        self.bPin.delegate = self
        self.bShare.delegate = self
        self.bReview.delegate = self
        self.bCheckin.delegate = self
        self.checkListReview()
        
        let tapReview = UITapGestureRecognizer(target: self, action: #selector(reviewTapped(tapGestureRecognizer:)))
        tapReview.cancelsTouchesInView = false
        self.bReview.imvButton.isUserInteractionEnabled = true
        self.bReview.imvButton.addGestureRecognizer(tapReview)
    }
    
    @objc func reviewTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        showSimpleAlert("REVIEW", "Your Review", "OK")
    }

    func checkListReview(){
        let listReview = Utilities.share.getListReview()
        if(listReview.count == 0){
            CreateDataDefault.share.CreateListReviewForPlace()
        }else{
            self.delegate.listReviewTemp = listReview
        }
        
    }
    //MARK: - UIAlertController
    func showSimpleAlert(_ titleAlert: String,_ message: String,_ titleAction: String ){
        let alert = UIAlertController(title: titleAlert, message: message,         preferredStyle: UIAlertController.Style.alert)
        alert.addTextField(configurationHandler: configtfx(_:))
        alert.addAction(UIAlertAction(title: titleAction, style: UIAlertAction.Style.default, handler: { _ in
            let text = (alert.textFields?.first as! UITextField).text
            self.review = ReviewModal.init(self.getday(), self.delegate.currentUser!.userName, self.delegate.currentUser!.imgAvatarName, text ?? "")
            var newListReview = Utilities.share.getListReview()
            newListReview.append(self.review!)
            Utilities.share.setListReview(newListReview)
             self.delegate.listReviewTemp = Utilities.share.getListReview()
            return
        }))
        delegate.nvc.present(alert, animated: true, completion: nil)
    }
    func configtfx(_ text: UITextField!){
        text.placeholder = "Your review"
    }
    func getday() -> String{
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        return formatter.string(from: date)
    }
}
