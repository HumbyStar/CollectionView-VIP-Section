//
//  BannerHomePresenter.swift
//  Component Collection View + Compositional
//
//  Created by Humberto Rodrigues on 24/06/23.
//

import Foundation

protocol BannerHomePresenterProtocol {
    func present(data: [BannerItem])
}

protocol BannerHomePresenterDisplayLogicProtocol {
    func display(viewModel: BannerHomeViewModel)
}

final class BannerHomePresenter: BannerHomePresenterProtocol {
    
    var view: BannerHomePresenterDisplayLogicProtocol?
    
    func present(data: [BannerItem]) {
        self.view?.display(viewModel: self.makeViewModel(banners: data))
    }
}

extension BannerHomePresenter {
    func makeViewModel(banners: [BannerItem]?) -> BannerHomeViewModel {
        
        var itens = [BannerItem]()
        banners?.forEach({ (bannerResponse) in
            itens.append(.init(title: bannerResponse.title,
                               image: bannerResponse.image))
        })
        
        return BannerHomeViewModel(itens: itens)
    }
}


