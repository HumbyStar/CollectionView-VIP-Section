//
//  BannerInteractor.swift
//  Component Collection View + Compositional
//
//  Created by Humberto Rodrigues on 24/06/23.
//

import Foundation

protocol BannerHomeInteractorProtocol {
    func loadBannersHome()
}

class BannerHomeInteractor: BannerHomeInteractorProtocol {
    private var presenter: BannerHomePresenterProtocol
    private var service: BannerHomeServiceProtocol
    
    init(presenter: BannerHomePresenterProtocol, service: BannerHomeServiceProtocol) {
        self.presenter = presenter
        self.service = service
    }
    
    func loadBannersHome() {
        service.loadBannerHome()
    }
}

extension BannerHomeInteractor: BannerHomeServiceDelegate {
    func teste() {
        print("Cai aqui")
    }
    
    
    func result(_ result: Result<[BannerItem], Error>) {
        DispatchQueue.main.async {
            switch result {
            case .success(let data):
                self.presenter.present(data: data)
            case .failure(let error):
                print("Não foi possível recuperar o resultado \(error.localizedDescription)")
            }
        }
    }

}
