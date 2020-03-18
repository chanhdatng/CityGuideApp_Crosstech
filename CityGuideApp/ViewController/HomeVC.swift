//
//  HomeVC.swift
//  CityGuideApp
//
//  Created by Chanh Dat Ng on 8/12/19.
//  Copyright © 2019 Chanh Dat Ng. All rights reserved.
//

import UIKit
import Foundation

class HomeVC: UIViewController, UICollectionViewDataSource , UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Variable
    @IBOutlet weak var vContainer: UIView!
    @IBOutlet weak var vContentView: UIView!
    @IBOutlet weak var clvListEvent: UICollectionView!
    @IBOutlet weak var pageView: UIPageControl!
    @IBOutlet weak var clvHotCity: UICollectionView!
    @IBOutlet weak var tbvHotPlace: UITableView!
    @IBOutlet weak var bMenu: BaseMenu!
    
    var allPlace = CreateDataDefault.share.CreateListAllPlace()
    var arrEvent = [UIImage(named: "imgHue"),UIImage(named: "imgNinhBinh"),UIImage(named: "imgVungTau"),UIImage(named: "imgDaNang")]
    var timer = Timer()
    var counter = 0
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.vContainer.backgroundColor = hexStringToUIColor(hex: "#F2F2F2")
        pageView.numberOfPages = arrEvent.count
        pageView.currentPage = 0
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        }
        
        self.bMenu.bHome.selectedHome()
        self.tbvHotPlace.backgroundColor = hexStringToUIColor(hex: "#ECEFF1")
        
        // Do any additional setup after loading the view.
        self.clvListEvent.delegate = self
        self.clvListEvent.dataSource = self
        self.clvListEvent.register(CollectionCell.self, forCellWithReuseIdentifier: "CollectionCell")
        self.clvListEvent.register(UINib(nibName: "CollectionCell", bundle: nil), forCellWithReuseIdentifier: "CollectionCell")
        
        self.clvHotCity.delegate = self
        self.clvHotCity.dataSource = self
        self.clvHotCity.register(HotCityList.self, forCellWithReuseIdentifier: "HotCityList")
        self.clvHotCity.register(UINib(nibName: "HotCityList", bundle: nil), forCellWithReuseIdentifier: "HotCityList")
        
        self.tbvHotPlace.delegate = self
        self.tbvHotPlace.dataSource = self
        self.tbvHotPlace.register(TbvPlaceCell.self, forCellReuseIdentifier: "TbvPlaceCell")
        self.tbvHotPlace.register(UINib(nibName: "TbvPlaceCell", bundle: nil), forCellReuseIdentifier: "TbvPlaceCell")
        allPlace = getTop10Place(self.allPlace)
    }
    
    func getTop5City(_ listCity: [CityModal]) -> [CityModal]{
        var newListCity = listCity
        var top5City = [CityModal]()
        newListCity.sort(by: {$0.rating > $1.rating})
        for i in 0...4{
            top5City.append(newListCity[i])
        }
        return top5City
    }
    
    func getTop10Place(_ listPlace: [PlaceModal]) -> [PlaceModal]{
        var newListPlace = listPlace
        var top10Place = [PlaceModal]()
        newListPlace.sort(by: {$0.rating > $1.rating })
        for i in 0...9 {
            top10Place.append(newListPlace[i])
        }
        return top10Place
    }
    
    @objc func changeImage() {
        if counter < arrEvent.count {
            let index = IndexPath.init(item: counter, section: 0)
            self.clvListEvent.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageView.currentPage = counter
            counter += 1
        } else {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.clvListEvent.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            pageView.currentPage = counter
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.clvListEvent {
            return arrEvent.count
        } else if collectionView == self.clvHotCity{
            return 5
        } else {
            return 2
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.clvListEvent {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
            cell.imvImage.image = arrEvent[indexPath.row]
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HotCityList", for: indexPath) as! HotCityList
            let top5City = getTop5City(CreateDataDefault.share.CreateListCity())
            cell.imvCity.image = UIImage(named: top5City[indexPath.row].imageCityName)
            cell.lblCity.text = top5City[indexPath.row].cityName
            cell.lblFeature.text = " Rating: "+"\(top5City[indexPath.row].rating)  "
            cell.createShadow(cell)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.clvHotCity {
            return CGSize(width: (self.clvHotCity.frame.width-30)*3/5, height: (self.clvHotCity.frame.height)*6/7)
        } else {
            return CGSize(width: 414, height: 300)
        }
    }
    
    // MARK: - TableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TbvPlaceCell") as! TbvPlaceCell
        cell.imvPlace.image = UIImage(named:self.allPlace[indexPath.section].imageName)
        cell.lblName.text = self.allPlace[indexPath.section].placeName
        cell.lblAddress.text = self.allPlace[indexPath.section].address
        cell.lblRating.text = "\(self.allPlace[indexPath.section].rating)"
        //        cell.layer.shadowOpacity = 0.5
        //        cell.layer.shadowColor = UIColor.black.cgColor
        //        cell.layer.shadowOffset = CGSize(width: 0, height: 0)
        cell.vContainer.layer.cornerRadius = 10
        cell.vContainer.clipsToBounds = false
//        cell.vContainer.backgroundColor = hexStringToUIColor(hex: "#c9df8a")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (self.tbvHotPlace.frame.height-25)/5
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(5)
    }
    
    // Make the background color show through
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
}
