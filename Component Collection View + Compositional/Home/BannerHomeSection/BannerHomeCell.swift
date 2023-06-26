//
//  BannerHomeCell.swift
//  Component Collection View + Compositional
//
//  Created by Humberto Rodrigues on 24/06/23.


import UIKit

class BannerHomeCell: UICollectionViewCell {

    var itens = [BannerItem]()

    lazy var bannerImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        return imageView
    }()
    
    
    private lazy var collectionView: CustomCollectionView = {
        let collection = CustomCollectionView.init(frame: .zero, collectionViewLayout: createCompositionalLayout())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsHorizontalScrollIndicator = false
        collection.delegate = self
        return collection
    }()
    
    func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
            // item
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            // grupo
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .absolute(200)) // Ajuste o valor de heightDimension conforme necessário
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

    
    func setupView() {
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            bannerImage.topAnchor.constraint(equalTo: topAnchor),
            bannerImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            bannerImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            bannerImage.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    func configure(item: String) {
        bannerImage.image = UIImage(named: item)
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


