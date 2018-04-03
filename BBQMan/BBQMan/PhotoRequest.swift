//
//  PhotoRequest.swift
//  WProficiencyTest
//
//  Created by Guxiaojie on 10/03/2018.
//  Copyright © 2018 SageGu. All rights reserved.
//

import UIKit
import SwiftyJSON

class PhotoRequest: NSObject {

    static let WURL: String = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
    
    class func downloadData(completion: @escaping (_ blog: Canada?,  _ error: Error?) -> Void ) {
        let request = URLRequest(url: URL(string: WURL)!)
        let session = URLSession.shared
        
        let dataTask : URLSessionDataTask = session.dataTask(with: request) { data, response, error in
            
            guard data != nil && error == nil else {
                print(error ?? "Error")
                completion(nil, error)
                return
            }
            
            completion(PhotoRequest.parseData(data: data!), error)
            
        }
        dataTask.resume()
    }
    
    class func downloadData1(completion: @escaping (_ blog: Canada?,  _ error: Error?) -> Void ) {
        let request = URLRequest(url: URL(string: WURL)!)
        let session = URLSession.shared
        let downloadTask: URLSessionDownloadTask = session.downloadTask(with: request) { location, response, error in
            guard location != nil && error == nil else {
                print(error ?? "Error")
                completion(nil, error)
                return
            }
            
            guard let data = try? Data(contentsOf: location!) else {
                print("Error: Couldn't read data")
                completion(nil, error)
                return
            }
            
            //why convert data?
            //Don't know why can't get JSON from JSONSerialization.jsonObject before converting
            //Here could be using Post instead of Download data/thrid part json/Swift 4 JSONDecoder()
            let convertString: NSString = NSString(data: data, encoding: 0)!
            guard let convertedData = convertString.data(using: String.Encoding.utf8.rawValue) else {
                print("Error: Couldn't convert data")
                completion(nil, error)
                return
            }
            
            completion(PhotoRequest.parseData(data: convertedData), error)

        }
        downloadTask.resume()
    }
    
    class func downloadImg(url: String, completion: @escaping (_ img: Data?,  _ error: Error?) -> Void ) {
        let request = URLRequest(url: URL(string: url)!)
        let session = URLSession.shared
        let downloadTask: URLSessionDownloadTask = session.downloadTask(with: request) { location, response, error in
            guard location != nil && error == nil else {
                print(error ?? "Error")
                completion(nil, error)
                return
            }
            
            guard let data = try? Data(contentsOf: location!) else {
                print("Error: Couldn't read data")
                completion(nil, error)
                return
            }
            completion(data, error)
            
            //More to go
            //Image Data Should be Cached
        }
        downloadTask.resume()
    }
    
    class func parseData(data: Data) -> Canada? {
        let dataString = String(data: data, encoding: String.Encoding.isoLatin1)
        guard let jsonString = dataString else {
            print("JSON Format Error!")
            return nil
        }
        
        let json = JSON(parseJSON: jsonString)
        
        let canada: Canada = Canada()
        canada.title = json["title"].string
        
        var photos = [Photo]()
        for row in json["rows"].arrayValue {
            photos.append(Photo(json: row))
        }
        canada.rows = photos
        
        return canada
    }
    
}
