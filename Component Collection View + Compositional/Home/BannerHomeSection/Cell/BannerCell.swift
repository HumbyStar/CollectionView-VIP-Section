//
//  BannerCell.swift
//  Component Collection View + Compositional
//
//  Created by Humberto Rodrigues on 25/06/23.
//

import UIKit

protocol BannerCellDelegate: AnyObject {
    func bannerClick()
}

class BannerCell: UICollectionViewCell {
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()

    lazy var bannerImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(bannerImage)
        NSLayoutConstraint.activate([
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


