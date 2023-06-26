//
//  BannerService.swift
//  Component Collection View + Compositional
//
//  Created by Humberto Rodrigues on 24/06/23.
//

import Foundation

protocol BannerHomeServiceDelegate: AnyObject {
    func result(_ result: Result<[BannerItem], Error>)
    func teste()
}

protocol BannerHomeServiceProtocol {
    func loadBannerHome()
    var delegate: BannerHomeServiceDelegate? {get set}
}

class BannerHomeService: BannerHomeServiceProtocol {
    
    let bannerItems = BannerData().popular
    weak var delegate: BannerHomeServiceDelegate?
    
    
    func loadBannerHome() {
        self.delegate?.teste()
        self.delegate?.result(.success(bannerItems))
    }
    
}
