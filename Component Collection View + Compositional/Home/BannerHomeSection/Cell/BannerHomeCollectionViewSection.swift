//
//  BannerHomeCollectionViewSection.swift
//  Component Collection View + Compositional
//
//  Created by Humberto Rodrigues on 24/06/23.
//

import UIKit

protocol BannerHomeCollectionViewSectionDelegate: AnyObject {
    func didLoadCollectionBannerHomeSection(_ section: SectionProtocol)
}

class BannerHomeCollectionViewSection: SectionProtocol {
    private var viewModel: BannerHomeViewModel?
    
    weak var delegate: BannerHomeCollectionViewSectionDelegate?
    
    func configure(viewModel: BannerHomeViewModel?) {
        self.viewModel = viewModel
        delegate?.didLoadCollectionBannerHomeSection(self)
    }
    
    func register(at collectionView: UICollectionView) {
        collectionView.register(BannerCell.self)
    }
    
    func numberOfItems() -> Int {
        return self.viewModel?.numberOfItems() ?? 0
    }
    
    func cellForItem(at indexPath: IndexPath, collectionView: UICollectionView) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(BannerCell.self, for: indexPath)

        guard let viewModel = viewModel else {
            return UICollectionViewCell()
        }
        
        cell.configure(item: viewModel.itemFor(index: indexPath.row))
        //Agora faz sentido configurar para entregar cada STRING DE IMAGEM
        
        return cell
    }
    
    func lineSpacing() -> CGFloat {
        return 12
    }
    
    func interitemSpacing() -> CGFloat {
        return 12
    }
    
    func insets(collectionView: UICollectionView) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0,
                            left: 12,
                            bottom: 0,
                            right: 12)
    }
}
