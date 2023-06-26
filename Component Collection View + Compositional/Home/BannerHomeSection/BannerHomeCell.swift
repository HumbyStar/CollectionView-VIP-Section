//
//  BannerHomeCell.swift
//  Component Collection View + Compositional
//
//  Created by Humberto Rodrigues on 24/06/23.


import UIKit

class BannerHomeCell: UICollectionViewCell {
    
    private var section: BannerHomeCollectionViewSection?
    var itens = [BannerItem]()
    
    private lazy var collectionView: CustomCollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionWidth = UICollectionViewLayoutAttributes()
        let width = frame.width
        layout.itemSize = CGSize(width: width * 0.85, height: 286)
        layout.scrollDirection = .horizontal
        let collection = CustomCollectionView.init(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsHorizontalScrollIndicator = false
        collection.delegate = self
        return collection
    }()
    
    public func setViewModel(viewModel: BannerHomeViewModel?) {
        DispatchQueue.main.async {
            self.collectionView.performBatchUpdates {
            } completion: { [weak self] _ in
                let section = BannerHomeCollectionViewSection() //Primeira vez que roda é quando iniciado não tem resposta
                section.delegate = self //Preciso entregar o delegate antes que ele volte no delegate BannerHCVSection
                section.configure(viewModel: viewModel)
                self?.section = section
                self?.collectionView.sections = [section]
                
            }
            
            self.setupView()
            self.collectionView.reloadData()
        }
    }
    
    func setupSection() -> BannerHomeCollectionViewSection {
        let section = BannerHomeCollectionViewSection()
        section.delegate = self
        return section
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        let attributes = super.preferredLayoutAttributesFitting(layoutAttributes)
        let collectionWidth = superview?.frame.width ?? 0.0
        attributes.size.width = collectionWidth
        attributes.size.height = 286
        return attributes
    }
    
    
    
    func setupView() {
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}

extension BannerHomeCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Cliquei aqui")
    }
}

extension BannerHomeCell: BannerHomeCollectionViewSectionDelegate {
    func didLoadCollectionBannerHomeSection(_ section: SectionProtocol) {
        collectionView.reloadData()
    }
}


