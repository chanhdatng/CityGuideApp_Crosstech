//
//  PlaceVC.swift
//  CityGuideApp
//
//  Created by Trương Quốc Tài on 8/19/19.
//  Copyright © 2019 Chanh Dat Ng. All rights reserved.
//

import UIKit

class PlaceVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var lblReview: UILabel!
    @IBOutlet weak var bHeader: BaseHeaderPlace!
    @IBOutlet weak var clvPlace: UICollectionView!
    @IBOutlet weak var tbvReview: UITableView!
    @IBOutlet weak var lblPlaceName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var btnDirection: UIButton!
    @IBAction func onBtnDirection(_ sender: Any) {
        UIApplication.shared.openURL(URL(string: "http://maps.google.com/maps/@10.775975,106.703081,15z")!)
    }
    
    
    var listReview :[ReviewModal] = []
    let listPlaceOfcity = CreateDataDefault.share.CreateListPlaceOfCity()
    let delegate = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        self.clvPlace.delegate = self
        self.clvPlace.dataSource = self
        self.tbvReview.dataSource = self
        self.tbvReview.delegate = self
        //registerUICollectionView
        self.clvPlace.register(ClvCell.self, forCellWithReuseIdentifier: "ClvCell")
        self.clvPlace.register(UINib(nibName: "ClvCell", bundle: nil), forCellWithReuseIdentifier: "ClvCell")
        //registerUITableView
        self.tbvReview.register(TbvReviewCell.self, forCellReuseIdentifier: "TbvReviewCell")
        self.tbvReview.register(UINib(nibName: "TbvReviewCell", bundle: nil), forCellReuseIdentifier: "TbvReviewCell")
        self.initUI()
        tbvReview.reloadData()
        let tapBack = UITapGestureRecognizer(target: self, action: #selector(backTapped(tapGestureRecognizer:)))
        tapBack.cancelsTouchesInView = false
        self.bHeader.bBack.imvButton.isUserInteractionEnabled = true
        self.bHeader.bBack.imvButton.addGestureRecognizer(tapBack)
        
        // tap Review
//        let tapReview = UITapGestureRecognizer(target: self, action: #selector(reviewTapped(tapGestureRecognizer:)))
//        tapReview.cancelsTouchesInView = false
//        self.bHeader.bReview.imvButton.isUserInteractionEnabled = true
//        self.bHeader.bReview.imvButton.addGestureRecognizer(tapReview)
        
    }
    @objc func backTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
//    @objc func reviewTapped(tapGestureRecognizer: UITapGestureRecognizer)
//    {
//        
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        self.listReview = delegate.listReviewTemp
        tbvReview.reloadData()
        if(delegate.placeName == "CHỢ BẾN THÀNH"){
            self.lblReview.text = "Reviews"
        }else{
            self.lblReview.text = "Reviews:  No Review"
        }
    }
    func initUI(){
        self.btnDirection.layer.cornerRadius = 5
        self.lblPlaceName.text = delegate.placeName
        
        if(delegate.cityName == "Hồ Chí Minh")
        {
            let listplaceHCM = self.listPlaceOfcity[0].listPlaceName
            for place in listplaceHCM{
                if(delegate.placeName == place.placeName){
                    self.lblDescription.text = place.descriptions
                    self.lblAddress.text =  "ĐC: " + place.address
                }
            }
        }else{
            self.lblDescription.text =  "No description!"
        }
        
    }
    //MARK: - CollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: clvPlace.frame.width - 10, height: clvPlace.frame.height - 10)
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ClvCell", for: indexPath) as! ClvCell
        cell.lblCityName.text = ""
        cell.vBlur.backgroundColor = .clear
        if(delegate.placeName == "CHỢ BẾN THÀNH"){
            cell.imgCity.image = UIImage.init(named: "imgChoBenThanh\(indexPath.row)")
            return cell
        }else{
            let listplaceHCM = self.listPlaceOfcity[0].listPlaceName
            for place in listplaceHCM{
                if(delegate.placeName == place.placeName){
                    cell.imgCity.image = UIImage.init(named: place.imageName)
                }
            }
        }
        return cell
    }
    //MARK: - TableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.listReview.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TbvReviewCell", for: indexPath) as! TbvReviewCell
        if(self.delegate.placeName == "CHỢ BẾN THÀNH"){
            cell.lblName.text = listReview[indexPath.section].userNameReview
            cell.lblRview.text = listReview[indexPath.section].description
            cell.lbldate.text = listReview[indexPath.section].date
            cell.imgUser.image = UIImage.init(named: listReview[indexPath.section].imageNameReview)
            return cell
        }else{
            cell.lblRview.text = ""
            cell.lblName.text = ""
            cell.lbldate.text = ""
            cell.lbldate.backgroundColor = .white
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(10)
    }
    
    // Make the background color show through
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Touch!")
    }
}
