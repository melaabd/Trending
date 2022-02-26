//
//  ImgProvider.swift
//  Trending
//
//  Created by melaabd on 2/26/22.
//

import UIKit

protocol RequestImages {}

// MARK: - ImgProvider to manage loading image from backend and save it in cache memory
final class ImgProvider: RequestImages {
    
    static var shared = ImgProvider()
    
    /// labeled thread for loafing images in background
    fileprivate let downloadQueue = DispatchQueue(label: "Images cache", qos: DispatchQoS.background)
    
    /// NSCache for loaded images
    internal var cache = NSCache<NSURL, UIImage>()
    
    private init(){}
    
    //MARK: - Fetch image from URL and Images cache
    fileprivate func loadImage(from url: URL, imgView: UIImageView) {
        downloadQueue.async(execute: { () -> Void in
            if let image = self.cache.object(forKey: url as NSURL) {
                DispatchQueue.main.async {
                    imgView.image = image
                }
                return
            }
            
            do {
                let data = try Data(contentsOf: url)
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.cache.setObject(image, forKey: url as NSURL)
                        imgView.image = image
                    }
                } else {
                    print("Could not decode image")
                }
            } catch {
                print("Could not load URL: \(url): \(error)")
            }
        })
    }
    
}

extension RequestImages where Self == ImgProvider {
    /// load image from remote
    /// - Parameters:
    ///   - url: `URL`
    ///   - imgView: `UIImageView`
    func requestImage(from url: URL, imgView: UIImageView) {
        self.loadImage(from: url, imgView: imgView)
    }
}
