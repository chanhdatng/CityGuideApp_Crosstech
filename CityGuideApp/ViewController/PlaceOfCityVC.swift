//
//  PlaceOfCityVC.swift
//  CityGuideApp
//
//  Created by Trương Quốc Tài on 8/15/19.
//  Copyright © 2019 Chanh Dat Ng. All rights reserved.
//

import UIKit
import Foundation
import GoogleMaps
import CoreLocation
import Alamofire
import SwiftyJSON

class PlaceOfCityVC: UIViewController, GMSMapViewDelegate,  CLLocationManagerDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var vContainer: UIView!
    @IBOutlet weak var vMap: UIView!
    @IBOutlet weak var vWeather: UIView!
    @IBOutlet weak var clvPlace: UICollectionView!
    @IBOutlet weak var clvFood: UICollectionView!
    @IBOutlet weak var imvWeather: UIImageView!
    @IBOutlet weak var scvScroll: UIScrollView!
    
    let appid = "33b31956e6f26b88cd43a117e8995301"
    var locationManager: CLLocationManager?
    var latitude: CLLocationDegrees?
    var longitude: CLLocationDegrees?

    var listmarker:[MarkerModal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GMSServices.provideAPIKey("AIzaSyCReWSsrTxDeDPDbjlPJhKxQBD1B2bBCO4")
        // setting location and show map
        settingLocation()
        getLocation()
        
        self.scvScroll.delegate = self
        self.clvFood.delegate = self
        self.clvFood.dataSource = self
        
        self.clvPlace.delegate = self
        self.clvPlace.dataSource = self
        
        let lat = "\(self.latitude ?? 35)"
        let lon = "\(self.longitude ?? 139)"
        
        //registerUICollectionView
        self.clvPlace.register(ClvCell.self, forCellWithReuseIdentifier: "ClvCell")
        self.clvPlace.register(UINib(nibName: "ClvCell", bundle: nil), forCellWithReuseIdentifier: "ClvCell")
        
        self.clvFood.register(ClvCell.self, forCellWithReuseIdentifier: "ClvCell")
        self.clvFood.register(UINib(nibName: "ClvCell", bundle: nil), forCellWithReuseIdentifier: "ClvCell")
        
        print(lat+" "+lon)
//        sendGetRequest(lat: lat, long: lon, appid: self.appid) { (error, weather) in
//            if error == ""{
//                self.imvWeather.image = UIImage(named: "\(weather!.weather.icon)")
//            } else {
//                print(error)
//            }
//        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    // MARK: - API
    func sendGetRequest(lat: String, long: String, appid : String , complete: @escaping(String, WeatherModal?) -> Void ){

        guard let url = URL(string:"https://api.openweathermap.org/data/2.5/weather?") else {
            return
        }
        
        let parameter : Parameters = [
            "lat"      : lat,
            "lon"  : long,
            "appid" : appid ]
        
        Alamofire.request(url, method: .get, parameters: parameter ,encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            guard response.result.isSuccess, let value = response.result.value else {
                complete(response.error!.localizedDescription, nil)
                return
            }
            
            let data = JSON(value)
            
            do {
                var weather = WeatherModal.init()
                weather.name = "\(data["name"])"
                weather.weather = try JSONDecoder().decode(WeatherInfoModal.self, from: data["weather"][0].rawData())
                //                let listWeather = data["weather"].array?.map({ weather -> WeatherModal in
                //                    return try! JSONDecoder().decode(WeatherModal.self, from: weather.rawData())
                //                })
                complete("",weather)
            } catch let err {
                print(err)
            }
        }

    }

   
    //MARK: - CollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ClvCell", for: indexPath) as! ClvCell
        let delegate = UIApplication.shared.delegate as! AppDelegate
        if(delegate.cityName == "Hồ Chí Minh"){
            if(collectionView == clvPlace){
                let listPlaceOfcity = CreateDataDefault.share.CreateListPlaceOfCity()
                let listPlaceHCM = listPlaceOfcity[0].listPlaceName
                cell.lblCityName.text = listPlaceHCM[indexPath.row].placeName
                cell.lblCityName.font = UIFont(name: "System Bold", size: 17)
                cell.imgCity.image = UIImage.init(named: listPlaceHCM[indexPath.row].imageName)
                return cell
            }else{
                let listPlaceOfcity = CreateDataDefault.share.CreateListPlaceOfCity()
                let listPlaceHCM = listPlaceOfcity[0].listPlaceName
                cell.lblCityName.text = listPlaceHCM[indexPath.row].placeName
                cell.lblCityName.font = UIFont(name: "System Bold", size: 17)
                cell.imgCity.image = UIImage.init(named: listPlaceHCM[indexPath.row].imageName)
                return cell
            }
        }else{
            cell.lblCityName.text = "Found"
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.clvPlace {
            return CGSize(width: (self.clvPlace.frame.width-10)/2, height: (self.clvPlace.frame.height))
        } else {
            return CGSize(width: (self.clvFood.frame.width-10)/2, height: (self.clvFood.frame.height))
        }

    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        if(delegate.cityName == "Hồ Chí Minh"){
            if(collectionView == clvPlace){
                let listPlaceOfcity = CreateDataDefault.share.CreateListPlaceOfCity()
                let listPlaceHCM = listPlaceOfcity[0].listPlaceName
                delegate.placeName = listPlaceHCM[indexPath.row].placeName
                
            }else{
                let listPlaceOfcity = CreateDataDefault.share.CreateListPlaceOfCity()
                let listPlaceHCM = listPlaceOfcity[0].listPlaceName
                delegate.placeName = listPlaceHCM[indexPath.row].placeName
            }
        }else{
            
        }
        
        let vc = Utilities.share.createVCwith(nameStoryboard.nameSB, nameVC.PlaceVC)
        self.navigationController?.pushViewController(vc, animated: true)
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
    
    func getLocation(){
        let status = CLLocationManager.authorizationStatus()
        
        if status == .denied || status == .restricted || CLLocationManager.locationServicesEnabled(){
            // show alert request usser enable location
            locationManager?.requestAlwaysAuthorization()
        }
        
        // if haven't show location permission dialog before, show it to user
        if(status == .notDetermined){
            locationManager?.requestWhenInUseAuthorization()
            // if you want the app to retrieve location data even in background, use requestAlwaysAuthorization
            locationManager?.requestAlwaysAuthorization()
            return
        }
        
        locationManager?.requestLocation()
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
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
            print("New location is \(locations)")
            self.latitude = location.coordinate.latitude
            self.longitude = location.coordinate.longitude
            //            SVProgressHUD.dismiss()
        }
        let camera = GMSCameraPosition.camera(withLatitude: self.latitude ?? 10.847846, longitude: self.longitude ?? 106.786015, zoom: 15)
        
//        let camera = GMSCameraPosition.camera(withLatitude:  10.772830, longitude: 106.698031, zoom: 15)
        let mapView = GMSMapView.init(frame: CGRect.zero, camera: camera)
        mapView.delegate = self
        mapView.frame = self.vMap.bounds
        self.vMap.addSubview(mapView)
        mapView.bringSubviewToFront(self.vMap)
        let currentMarker = GMSMarker()
        
        //
        currentMarker.position = CLLocationCoordinate2DMake(self.latitude ?? 10.847846, self.longitude ?? 106.786015)
        currentMarker.snippet = ""
        currentMarker.map = mapView
        
        // Creates a marker in the center of the map.
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        
        let listCity:[CityModal] = CreateDataDefault.share.CreateListCity()
        
        for city in listCity{
            if delegate.cityName == city.cityName{
                self.listmarker = CreateDataDefault.share.CreateListMarker(cityName: delegate.cityName)
            }
        }
        for mar in self.listmarker{
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2DMake(mar.location.latitude!, mar.location.longitude!)
            marker.title = mar.title
            marker.snippet = mar.snippet
            marker.map = mapView
            //them anh theo tung mark
            let img = UIImage(named: "ico_marker")
            let newImg = img?.changeSizeImage(image: img!, targetSize: CGSize(width: 48, height: 48))
            marker.icon = newImg
            marker.iconView?.contentMode = .scaleToFill
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // might be that user didn't enable location service on the device
        // or there might be no GPS signal inside a building
        print("can not get location")
        // might be a good idea to show an alert to user to ask them to walk to a place with GPS signal
    }
    
    // MARK: - GMSMapViewDelegate
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
//        let delegate = UIApplication.shared.delegate as! AppDelegate
//        delegate.locationUser = LocationModal.init(self.latitude!, self.longitude!)
        let vc  = Utilities.share.createVCwith(nameStoryboard.nameSB, nameVC.PlaceVC)
        self.navigationController?.pushViewController(vc, animated: true)
        return true
    }
    
    
    
    //MARK: - Weather


}

extension UIImage{
    func changeSizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}
