//
//  Utilities.swift
//  CityGuideApp
//
//  Created by Trương Quốc Tài on 8/15/19.
//  Copyright © 2019 Chanh Dat Ng. All rights reserved.
//

import UIKit

class Utilities: NSObject {
    static let share = Utilities()
    
    func createVCwith(_ nameSB: String, _ nameVC: String) -> UIViewController {
        return UIStoryboard.init(name: nameSB, bundle: nil).instantiateViewController(withIdentifier: nameVC)
    }
    
    //MARK: - UserDefault--UserModal
    func getListUser() -> [UserModal]{
        if let data = UserDefaults.standard.value(forKey: "listUser") as? Data {
            return try! PropertyListDecoder().decode([UserModal].self, from: data)
        }
        return []
    }
    
    func setListUser(_ listUser:[UserModal]){
        UserDefaults.standard.set(try? PropertyListEncoder().encode(listUser), forKey :"listUser")
        UserDefaults.standard.synchronize()
    }
    
    func updateListUser(_ newUser:UserModal){
        var listUser = self.getListUser()
        var flag : Bool = false
        if (listUser.count == 0) {
            listUser.append(newUser)
        } else {
            for i in 0...listUser.count-1{
                if (listUser[i].email == newUser.email){
                    listUser[i] = newUser
                    flag = true
                    break
                }
            }
            if(flag == false){
                
                listUser.append(newUser)
            }
        }
        self.setListUser(listUser)
    }
    
    func checkUserInList(_ newUser:UserModal) -> Bool{
        let listUser = self.getListUser()
        for user in listUser{
            if(user.email == newUser.email && user.passWord == newUser.passWord){
                return true
            }
        }
        return false
    }
    
    func checkEmailUserInList(_ newUser:UserModal) -> Bool{
        let listUser = self.getListUser()
        for user in listUser{
            if(user.email == newUser.email){
                return true
            }
        }
        return false
    }
    
    func getCurrentUser(_ email: String) -> UserModal{
        let listUser = self.getListUser()
        for user in listUser{
            if (user.email == email){
                return user
            }
        }
        return UserModal.init("", "", "", "", "", 0, [""],"","")
    }
    //MARK: - UserDefault--ReviewModal
    func getListReview() -> [ReviewModal]{
        if let data = UserDefaults.standard.value(forKey: "listReview") as? Data {
            return try! PropertyListDecoder().decode([ReviewModal].self, from: data)
        }
        return []
    }
    func setListReview(_ listReview:[ReviewModal]){
        UserDefaults.standard.set(try? PropertyListEncoder().encode(listReview), forKey :"listReview")
        UserDefaults.standard.synchronize()
    }
    
    
    func alertMessageBox(_ title: String,_ message: String, _ button: String,_ view: UIViewController){
        // create the alert
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: button, style: UIAlertAction.Style.default, handler: nil))
        
        // show the alert
        view.present(alert, animated: true, completion: nil)
    }
    
}

