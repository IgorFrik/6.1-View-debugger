//
//  LeakedViewController.swift
//  6.1 View debugger
//
//  Created by Igor Frik on 21.08.2022.
//

import UIKit

class LeakedViewController: UIViewController, PhotoGalleryManagerDelegate {
    
    let manager = PhotoGalleryManager()
    var counter = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        print("LeakedViewController+++")
        
        manager.delegate = self
        let proxy = GalleryProxy()
        proxy.controller = self
        manager.galeryProxy = proxy
        
        manager.callback = {
            self.counter += 1
        }
    }
}

protocol PhotoGalleryManagerDelegate {
    //
}

class PhotoGalleryManager {
    var delegate: PhotoGalleryManagerDelegate?
    var galeryProxy: GalleryProxy?
    var callback: (() -> ())?
}

class GalleryProxy {
    var controller: UIViewController?
}
