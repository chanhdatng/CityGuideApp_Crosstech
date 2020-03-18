//
//  LoginVC.swift
//  CityGuideApp
//
//  Created by Trương Quốc Tài on 8/9/19.
//  Copyright © 2019 Chanh Dat Ng. All rights reserved.
//

import UIKit
import Foundation
import CoreLocation
import Firebase
import GoogleSignIn

class LoginVC: UIViewController, BaseButtonDelegate, CLLocationManagerDelegate, GIDSignInUIDelegate {
    
    @IBOutlet var vContainer: UIView!
    @IBOutlet weak var vLogin: UIView!
    @IBOutlet weak var imvLogo: UIImageView!
    @IBOutlet weak var bUsername: BaseEnterData!
    @IBOutlet weak var bPassword: BaseEnterData!
    @IBOutlet weak var bBtnLogin: BaseButton!
    @IBOutlet weak var btnForgotPassword: UIButton!
    @IBOutlet weak var lblLoginwith: UILabel!
    @IBOutlet weak var bBtnFacebook: BaseButton!
    @IBOutlet weak var bBtnGoogle: BaseButton!
    @IBOutlet weak var imvCity: UIImageView!
    @IBOutlet weak var btnSignUp: UIButton!
    var locationManager: CLLocationManager?
    let delegate = UIApplication.shared.delegate as! AppDelegate
    var currentUser : UserModal?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        initUI()
        // Do any additional setup after loading the view.
        self.settingLocation()
        self.bBtnLogin.dele = self
        self.bBtnGoogle.dele = self
        self.bBtnFacebook.dele = self
        self.bPassword.txfEnterData.isSecureTextEntry = true
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action:#selector(UIView.endEditing(_:))))
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.bPassword.txfEnterData.text = ""
        self.bUsername.txfEnterData.text = ""
        GIDSignIn.sharedInstance()?.uiDelegate = self
        GIDSignIn.sharedInstance()?.delegate = self
    }
    
    @objc func handleGoogleSignIn() {
        
    }
    
    func initUI(){
        self.bUsername.setPlaceholder("Email")
        self.bUsername.setCornerRadious(20)
//        self.bUsername.setBGColor(hexStringToUIColor(hex: "#AFD582"))
        self.bPassword.setPlaceholder("Password")
        self.bPassword.setCornerRadious(20)
//        self.bPassword.setBGColor(hexStringToUIColor(hex: "#AFD582"))
        
        self.bBtnLogin.btnButton.setTitle("Login", for: .normal)
        self.bBtnLogin.setColor(hexStringToUIColor(hex: "#719548"))
        self.bBtnLogin.setCornerRadious(CGFloat(20))
        
        self.bBtnFacebook.setColor(.blue)
        self.bBtnFacebook.btnButton.setTitle("Facebook", for: .normal)
        self.bBtnFacebook.setCornerRadious(20)
        
        self.bBtnGoogle.setColor(.red)
        self.bBtnGoogle.btnButton.setTitle("Google+", for: .normal)
        self.bBtnGoogle.setCornerRadious(20)
        
        self.bUsername.txfEnterData.keyboardType = .emailAddress
        
    }

    @IBAction func onBtnSignUp(_ sender: Any) {
        let vc = Utilities.share.createVCwith(nameStoryboard.nameSB, nameVC.SignUpVC)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    //MARK: - BaseButton
    func clickButton(_ view: UIView, _ sender: UIButton) {
        if (view == self.bBtnLogin) {
            if(bUsername.txfEnterData.text != "" && bPassword.txfEnterData.text != ""){
                let loginUser = UserModal.init("", bPassword.txfEnterData.text!, "", bUsername.txfEnterData.text!, "", 0, [""],"","")
                if(Utilities.share.checkUserInList(loginUser) == false){
                    Utilities.share.alertMessageBox("ERROR!", "Email or Password is wrong!", "OK", self)
                    
                }else{
                    // Login Successfully
                    let vc = Utilities.share.createVCwith(nameStoryboard.nameSB, nameVC.HomeVC)
                    self.navigationController?.pushViewController(vc, animated: true)
                    currentUser = Utilities.share.getCurrentUser(self.bUsername.txfEnterData.text!)
                    delegate.currentUser = currentUser
                }
            }
            else{
                Utilities.share.alertMessageBox("ERROR!", "Please fill your information!", "OK", self)
            }
        } else if (view == self.bBtnGoogle) {
            print("Google Login")
            GIDSignIn.sharedInstance()?.signIn()
        } else {
            print("Facebook Login")
        }

    }
    //MARK: - Location
    func settingLocation(){
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        // request have location of device when using application, it will show alert for user accept or not
        //        locationManager?.requestWhenInUseAuthorization()
        // request alway have location of device despire not use application, it will show alert for user accept or not
        locationManager?.requestAlwaysAuthorization()
    }
    
    //MARK: - CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("location manager authorization changed")
        switch  status {
        case .authorizedAlways:
            print("user allow app to get location data when app is active or in background")
        case .authorizedWhenInUse:
            print("user allow app to get location data only when app is active")
        case .denied:
            print("user did not allow to get location data")
        case .restricted:
            print("parental control settinf disallow location data")
        case .notDetermined:
            print("the location permission dialog haven't show before, usser haven't tab allow/disallow ")
        default:
            print("can not check")
        }
    }
    
}

func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    
    if ((cString.count) != 6) {
        return UIColor.gray
    }
    
    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)
    
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

extension LoginVC: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        if let error = error {
            print("Failed to sign in with error:", error)
            return
        }
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
        
        Auth.auth().signInAndRetrieveData(with: credential) { (result, error) in
            
            if let error = error {
                print("Failed to sign in and retrieve data with error:", error)
                return
            }
            
            guard let uid = result?.user.uid else { return }
            guard let email = result?.user.email else { return }
            guard let username = result?.user.displayName else { return }
            
            let values = ["email": email, "username": username]
            
            Database.database().reference().child("users").child(uid).updateChildValues(values, withCompletionBlock: { (error, ref) in
                guard let navController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController else { return }
//                guard let controller = navController.viewControllers[0] as? LoginVC else { return }
               // controller.configureViewComponents()
//                let vc = Utilities.share.createVCwith(nameStoryboard.nameSB, nameVC.HomeVC)
//                self.navigationController?.pushViewController(vc, animated: true)
                // forgot to add this in video
               // controller.loadUserData()
                let newUser = UserModal.init(username, "123", "", email, "ava1", 0, [""],"","")
                if(Utilities.share.checkEmailUserInList(newUser) == true){
                    Utilities.share.alertMessageBox("ERROR!", "This account already exists!", "Try again", self)
                }
                else{
                    Utilities.share.updateListUser(newUser)
                }
                self.dismiss(animated: true, completion: nil)
            })
        }
    }
}
