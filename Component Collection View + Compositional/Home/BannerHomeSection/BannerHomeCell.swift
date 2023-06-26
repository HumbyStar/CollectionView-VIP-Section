//
//  BannerHomeCell.swift
//  Component Collection View + Compositional
//
//  Created by Humberto Rodrigues on 24/06/23.

import UIKit

class BannerHomeCell: UICollectionViewCell {

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


