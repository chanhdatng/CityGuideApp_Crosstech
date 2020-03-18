//
//  CityVC.swift
//  CityGuideApp
//
//  Created by Trương Quốc Tài on 8/15/19.
//  Copyright © 2019 Chanh Dat Ng. All rights reserved.
//

import UIKit


class CityVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIGestureRecognizerDelegate {
    
    // MAKR: - Variable
    
    @IBOutlet weak var vContainer: UIView!
    @IBOutlet weak var bMenu: BaseMenu!
    @IBOutlet weak var clvCity: UICollectionView!
    @IBOutlet weak var vHeader: UIView!
    @IBOutlet weak var bTextCity: BaseEnterData!
    @IBOutlet weak var bSearch: BaseButton!
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bMenu.bMap.selectedMap()
        self.clvCity.delegate = self
        self.clvCity.dataSource = self
        
        //registerUICollectionView
        self.clvCity.register(ClvCell.self, forCellWithReuseIdentifier: "ClvCell")
        self.clvCity.register(UINib(nibName: "ClvCell", bundle: nil), forCellWithReuseIdentifier: "ClvCell")
        // Do any additional setup after loading the view.
        
        self.bSearch.btnButton.setTitle("Search", for: .normal)
        self.bSearch.setColor(hexStringToUIColor(hex: "#719548"))
        self.bSearch.setCornerRadious(20)
        
        self.bTextCity.setPlaceholder("Find your city..")
        self.bTextCity.txfEnterData.font = UIFont(name: "System", size: 15)
        self.bTextCity.setCornerRadious(10)
        
//        self.bTextCity.setBGColor(hexStringToUIColor(hex: "#719548"))
        hideKeyboard()
        self.vContainer.backgroundColor = hexStringToUIColor(hex: "#F2F2F2")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ClvCell", for: indexPath) as! ClvCell
        let listCity:[CityModal] = CreateDataDefault.share.CreateListCity()
        cell.imgCity.image = UIImage.init(named: listCity[indexPath.row].imageCityName)
        cell.lblCityName.text = listCity[indexPath.row].cityName
        cell.createShadow(cell)
        return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.view.frame.width-25)/2, height: (self.clvCity.frame.height-20)/4)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let listCity:[CityModal] = CreateDataDefault.share.CreateListCity()
        let delegate = UIApplication.shared.delegate as! AppDelegate
        delegate.cityName = listCity[indexPath.row].cityName
        let vc = Utilities.share.createVCwith(nameStoryboard.nameSB, nameVC.PlaceOfCityVC)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension UIViewController{
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}

