//
//  SignUpVC.swift
//  CityGuideApp
//
//  Created by Chanh Dat Ng on 8/9/19.
//  Copyright © 2019 Chanh Dat Ng. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController,BaseButtonDelegate {
    

    @IBOutlet weak var vContainer: UIView!
    @IBOutlet weak var vSignUp: UIView!
    @IBOutlet weak var imvLogo: UIImageView!
    @IBOutlet weak var bName: BaseEnterData!
    @IBOutlet weak var bEmail: BaseEnterData!
    @IBOutlet weak var bMobile: BaseEnterData!
    @IBOutlet weak var bPassword: BaseEnterData!
    @IBOutlet weak var bBtnSignUp: BaseButton!
    @IBOutlet weak var imvCity: UIImageView!
    @IBOutlet weak var btnLogIn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        self.bBtnSignUp.dele = self
        self.bPassword.txfEnterData.isSecureTextEntry = true
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action:#selector(UIView.endEditing(_:))))
    }
    func initUI(){
        self.bName.setPlaceholder("Full name")
        self.bName.setCornerRadious(20)
        self.bEmail.setPlaceholder("Email")
        self.bEmail.setCornerRadious(20)
        self.bMobile.setPlaceholder("Mobile")
        self.bMobile.setCornerRadious(20)
        self.bPassword.setPlaceholder("Password")
        self.bPassword.setCornerRadious(20)
        self.bBtnSignUp.btnButton.setTitle("Sign Up", for: .normal)
        self.bBtnSignUp.setCornerRadious(20)
        self.bBtnSignUp.setColor(hexStringToUIColor(hex: "#719548"))
        self.bEmail.txfEnterData.keyboardType = .emailAddress
        self.bMobile.txfEnterData.keyboardType = .phonePad
    }

    @IBAction func onBtnLogIn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    func clickButton(_ view: UIView,_ sender: UIButton) {
        if(bName.txfEnterData.text != "" && bPassword.txfEnterData.text != "" && bMobile.txfEnterData.text != "" &&  bEmail.txfEnterData.text != ""){
            if (isValidEmail(emailStr: bEmail.txfEnterData.text!) == false ){
                Utilities.share.alertMessageBox("ERROR!", "Email is wrong!", "Try again", self)
            } else if (isValidFullname(fullnameStr: bName.txfEnterData.text!) == false) {
                Utilities.share.alertMessageBox("ERROR!", "Fullname is wrong!", "Try again", self)
            } else if (isValidPhoneNumber(phonenumberStr: bMobile.txfEnterData.text!) == false){
                Utilities.share.alertMessageBox("ERROR!", "NumberPhone is wrong!", "Try again", self)
            } else {
                let newUser = UserModal.init(bName.txfEnterData.text!, bPassword.txfEnterData.text!, bMobile.txfEnterData.text!, bEmail.txfEnterData.text!, "ava1", 0, [""],"","")
                if(Utilities.share.checkEmailUserInList(newUser) == true){
                    Utilities.share.alertMessageBox("ERROR!", "This account already exists!", "Try again", self)
                }
                else{
                    Utilities.share.updateListUser(newUser)
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
    }
    
    func isValidEmail(emailStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: emailStr)
    }
    
    //Bắt valid họ tên
    func isValidFullname(fullnameStr:String) -> Bool {
        let fullnameRegEx = "[A-Za-z àáãạảăắằẳẵặâấầẩẫậèéẹẻẽêềếểễệđìíĩỉịòóõọỏôốồổỗộơớờởỡợùúũụủưứừửữựỳỵỷỹýÀÁÃẠẢĂẮẰẲẴẶÂẤẦẨẪẬÈÉẸẺẼÊỀẾỂỄỆĐÌÍĨỈỊÒÓÕỌỎÔỐỒỔỖỘƠỚỜỞỠỢÙÚŨỤỦƯỨỪỬỮỰỲỴỶỸÝ]{5,64}"
        
        let fullnamePred = NSPredicate(format:"SELF MATCHES %@", fullnameRegEx)
        return fullnamePred.evaluate(with: fullnameStr)
    }
    
    func isValidPhoneNumber(phonenumberStr:String) -> Bool {
        let phonenumberRegEx = "[0-9()+]{10,13}"
        
        let numberphonePred = NSPredicate(format:"SELF MATCHES %@", phonenumberRegEx)
        return numberphonePred.evaluate(with: phonenumberStr)
    }
}

