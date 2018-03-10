//
//  PhotoRequest.swift
//  WProficiencyTest
//
//  Created by Guxiaojie on 10/03/2018.
//  Copyright © 2018 SageGu. All rights reserved.
//

import UIKit


class PhotoRequest: NSObject {
    static let WURL: String = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"

    class func downloadData() {
        let request = URLRequest(url: URL(string: WURL)!)
        let session = URLSession.shared
        let downloadTask: URLSessionDownloadTask = session.downloadTask(with: request) { location, response, error in
           
        }
        downloadTask.resume()
    }
    
    
}
