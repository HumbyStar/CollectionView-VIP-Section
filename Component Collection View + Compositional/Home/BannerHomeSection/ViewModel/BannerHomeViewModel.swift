//
//  BannerHomeViewModel.swift
//  Component Collection View + Compositional
//
//  Created by Humberto Rodrigues on 24/06/23.
//

import Foundation

class BannerHomeViewModel {
    let itens: [BannerItem]
    
    init(itens: [BannerItem]) {
        self.itens = itens
    }
    
    func numberOfItems() -> Int {
        return itens.count
    }
    
    func itemFor(index item: Int) -> String {
        return itens[item].image
    }
    
}

struct BannerItem{
    let title: String
    let image: String
}
