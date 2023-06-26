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
    
    func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
            // item
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            // grupo
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)) // Ajuste o valor de heightDimension conforme necessário
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            // seção
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
            
            // espaçamentos e bordas
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 12)
            section.interGroupSpacing = 12
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 12)
            
            return section
        }
        return layout
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
        return self.viewModel?.numberOfItems() ?? 0
    }
    
    func cellForItem(at indexPath: IndexPath, collectionView: UICollectionView) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(BannerHomeCell.self, for: indexPath)
        //        cell.setViewModel(viewModel: viewModel)
        
        guard let viewModel = viewModel else {
            return UICollectionViewCell()
        }
        
        cell.configure(item: viewModel.itemFor(index: indexPath.row))
        
        return cell
    }
    
    func layoutSection() -> NSCollectionLayoutSection? {
        // item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // grupo
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .absolute(250)) // Ajuste o valor de heightDimension conforme necessário
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // seção
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        // espaçamentos e bordas
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 12)
        section.interGroupSpacing = 12
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 12)
        
        return section
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
