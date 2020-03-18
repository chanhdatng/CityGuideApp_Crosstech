//
//  UserVC.swift
//  CityGuideApp
//
//  Created by Trương Quốc Tài on 8/15/19.
//  Copyright © 2019 Chanh Dat Ng. All rights reserved.
//

import UIKit
import Photos

class UserVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, BaseHeaderUserDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var vContainer: UIView!
    @IBOutlet weak var bMenu: BaseMenu!
    @IBOutlet weak var clvListCity: UICollectionView!
    @IBOutlet weak var clvListPlace: UICollectionView!
    @IBOutlet weak var bHeader: BaseHeaderUser!
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    var currentUser : UserModal?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bMenu.bUser.selectedUser()
        self.bHeader.dele = self
        self.bHeader.backgroundColor = hexStringToUIColor(hex: "#D0F0C0")
        self.clvListCity.backgroundColor = hexStringToUIColor(hex: "#D0F0C0")
        self.clvListPlace.backgroundColor = hexStringToUIColor(hex: "#D0F0C0")
        self.vContainer.backgroundColor = hexStringToUIColor(hex: "#D0F0C0")
        // Do any additional setup after loading the view.
        self.clvListCity.delegate = self
        self.clvListCity.dataSource = self
        self.clvListCity.register(UserList.self, forCellWithReuseIdentifier: "UserList")
        self.clvListCity.register(UINib(nibName: "UserList", bundle: nil), forCellWithReuseIdentifier: "UserList")
        
        self.clvListPlace.delegate = self
        self.clvListPlace.dataSource = self
        self.clvListPlace.register(TraveloguesList.self, forCellWithReuseIdentifier: "TraveloguesList")
        self.clvListPlace.register(UINib(nibName: "TraveloguesList", bundle: nil), forCellWithReuseIdentifier: "TraveloguesList")
        
        currentUser = delegate.currentUser
//        if let avaUser = UserDefaults.standard.value(forKey: self.currentUser!.email) as? Data {
//            return try! PropertyListDecoder().decode(UIImage.self, from: avaUser)
//        }
        let dataAvaUser = UserDefaults.standard.object(forKey: self.currentUser!.email)
        if (dataAvaUser != nil){
            self.bHeader.imvAva.image = UIImage(data: dataAvaUser as! Data, scale: 1)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.clvListCity {
            return CGSize(width: (self.clvListCity.frame.width)/3, height: (self.clvListCity.frame.height))
        } else {
            return CGSize(width: (self.clvListPlace.frame.width), height: (self.clvListPlace.frame.height))
        }
        
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.clvListCity {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserList", for: indexPath)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TraveloguesList", for: indexPath)
            return cell
        }
    }
    
    func clickBtnChangeAva() {
        let image = UIImagePickerController()
        image.delegate = self
        
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        image.allowsEditing = false
        
        self.present(image, animated: true) {
            print("DONE!")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.bHeader.imvAva.image = pickedImage
            let imageData = pickedImage.jpegData(compressionQuality: 1)
//            UserDefaults.standard.set(try? PropertyListEncoder().encode(imageData), forKey: self.currentUser!.email)
            UserDefaults.standard.set(imageData,forKey: self.currentUser!.email)
            UserDefaults.standard.synchronize()
        } else {
            print("ERROR?")
        }
        
        guard let fileUrl = info[UIImagePickerController.InfoKey.imageURL] as? URL else { return }
        let newAvaName = fileUrl.lastPathComponent
        currentUser!.imgAvatarName = newAvaName
        self.dismiss(animated: true, completion: nil)
        delegate.currentUser = currentUser
        Utilities.share.updateListUser(currentUser!)
        let checkuser = Utilities.share.getCurrentUser(currentUser!.email)

    }
}
