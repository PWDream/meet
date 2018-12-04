//
//  GaodeService.swift
//  Meet
//
//  Created by 潘威 on 2018/12/4.
//  Copyright © 2018 潘威. All rights reserved.
//

import Foundation

public class MeetMapService: NSObject,AMapLocationManagerDelegate {
    static let shared = MeetMapService()
    private override init() {}
    lazy var locationManager = AMapLocationManager()
    private let defaultLocationTimeout = 6
    private let defaultReGeocodeTimeout = 3
    
    public var currentCity = ""
    
    
    public func configLocationManager() {
        AMapServices.shared().apiKey = GAODEKEY
        locationManager.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        
        locationManager.pausesLocationUpdatesAutomatically = false
        
        locationManager.allowsBackgroundLocationUpdates = true
        
        locationManager.locationTimeout = defaultLocationTimeout
        
        locationManager.reGeocodeTimeout = defaultReGeocodeTimeout
    }
    
    public func startLocation() {
        locationManager.requestLocation(withReGeocode: true, completionBlock: {(location: CLLocation?, reGeocode: AMapLocationReGeocode?, error: Error?) in
            
            if let error = error {
                let error = error as NSError
                
                if error.code == AMapLocationErrorCode.locateFailed.rawValue {
                    //定位错误：此时location和regeocode没有返回值，不进行annotation的添加
                    NSLog("定位错误:{\(error.code) - \(error.localizedDescription)};")
                    return
                }
                else if error.code == AMapLocationErrorCode.reGeocodeFailed.rawValue
                    || error.code == AMapLocationErrorCode.timeOut.rawValue
                    || error.code == AMapLocationErrorCode.cannotFindHost.rawValue
                    || error.code == AMapLocationErrorCode.badURL.rawValue
                    || error.code == AMapLocationErrorCode.notConnectedToInternet.rawValue
                    || error.code == AMapLocationErrorCode.cannotConnectToHost.rawValue {
                    
                    //逆地理错误：在带逆地理的单次定位中，逆地理过程可能发生错误，此时location有返回值，regeocode无返回值，进行annotation的添加
                    NSLog("逆地理错误:{\(error.code) - \(error.localizedDescription)};")
                }
                else {
                    //没有错误：location有返回值，regeocode是否有返回值取决于是否进行逆地理操作，进行annotation的添加
                }
            }
            
            if let location = location {
                NSLog("location:%@", location)
            }
            
            if let reGeocode = reGeocode {
                NSLog("reGeocode:%@", reGeocode)
                self.currentCity = reGeocode.city
                self.currentCity.remove(at: self.currentCity.index(before: self.currentCity.endIndex))
                NSLog("reGeocode:%@", self.currentCity)
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: CityChangeKey), object: self.currentCity)
            }
        })
    }
}
