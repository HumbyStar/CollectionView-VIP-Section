//
//  BannerHomeSection.swift
//  Component Collection View + Compositional
//
//  Created by Humberto Rodrigues on 24/06/23.
//

import UIKit

protocol BannerHomeSectionDelegate: AnyObject {
    func didLoadBannerHomeSection(_ section: SectionProtocol)
}

class BannerHomeSection: SectionProtocol {
    
    private var viewModel: BannerHomeViewModel?
    var interactor: BannerHomeInteractorProtocol
    
    weak var delegate: BannerHomeSectionDelegate?
    
    init(interactor: BannerHomeInteractorProtocol) {
        self.interactor = interactor
        fetch()
    }
    
    func fetch() {
        interactor.loadBannersHome()
    }
    
}

extension BannerHomeSection: BannerHomePresenterDisplayLogicProtocol {
    func display(viewModel: BannerHomeViewModel) {
        self.viewModel = viewModel
        delegate?.didLoadBannerHomeSection(self)
    }
}

extension BannerHomeSection {
    func register(at collectionView: UICollectionView) {
        collectionView.register(BannerHomeCell.self)
    }
    
    func numberOfItems() -> Int {
        return 1
    }
    
    func cellForItem(at indexPath: IndexPath, collectionView: UICollectionView) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(BannerHomeCell.self, for: indexPath)
        cell.setViewModel(viewModel: viewModel)
        return cell
    }
}

extension BannerHomeSection {
    static func configureView() -> BannerHomeSection {
        let presenter = BannerHomePresenter()
        let service = BannerHomeService()
        let interactor = BannerHomeInteractor(presenter: presenter, service: service)
        let section = BannerHomeSection(interactor: interactor)
        service.delegate = interactor
        presenter.view = section
        //interactor está recebendo a responsabilidade
        //section está recebendo a responsabilidade da presenter.view
        return section
    }
}
