//
//  View.swift
//  Component Collection View + Compositional
//
//  Created by Humberto Rodrigues on 24/06/23.
//

import UIKit

class View: UIView {
    private lazy var collectionView: CustomCollectionView = {CustomCollectionView(frame: .zero, autosizing: true)}()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraint() {
        collectionView.backgroundColor = .green
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    public func setSections(_ sections: [SectionProtocol]) { //Ve no código da PTZ como fazer a factory depois
        collectionView.sections = sections
    }
    
    public func loadSections() {
        collectionView.sections.forEach({ ($0 as? SectionProtocol)?.fetch() })
    }
    
    func reloadData() {
        collectionView.reloadData()
    }
    
}

extension View: BannerHomeSectionDelegate {
    func didLoadBannerHomeSection(_ section: SectionProtocol) {
        collectionView.reloadData()
    }
}
