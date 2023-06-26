//
//  CustomCollectionView.swift
//  Component Collection View + Compositional
//
//  Created by Humberto Rodrigues on 24/06/23.
//

import UIKit

class CustomCollectionView: UICollectionView {
    var sections: [SectionProtocol] = [] {
        didSet {
            register()
        }
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        delegate = self
        dataSource = self
    }
    
    convenience public init(frame: CGRect, autosizing: Bool) {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize     //Irá se ajustar automaticamente
        self.init(frame: frame, collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func register() {
        sections.forEach({$0.register(at: self)})
    }
}

extension CustomCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        sections[safeIndex: indexPath.section]?.didSelectItem(at: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        sections[safeIndex: indexPath.section]?.willDisplay(at: indexPath, collectionView: collectionView, cell: cell)
    }
    
    //cell: A celula do UICollectionView que está prestes a ser exibida
    //indexPath: O indice da célula que está prestes a ser exibida.
}

extension CustomCollectionView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[safeIndex: section]?.numberOfItems() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        sections[safeIndex: indexPath.section]?.cellForItem(at: indexPath, collectionView: collectionView) ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            return sections[safeIndex: indexPath.section]?.headerView(at: indexPath, collectionView: collectionView) ?? UICollectionReusableView()
        } else {
            return sections[safeIndex: indexPath.section]?.footerView(at: indexPath, collectionView: collectionView) ?? UICollectionReusableView()
        }
    }

}

extension CustomCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        //sections[safeIndex: section]?.footerSize(collectionView: collectionView, section: section) ?? .zero
        
        sections[section].footerSize(collectionView: collectionView, section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        //sections[safeIndex: section]?.headerSize(collectionView: collectionView, section: section) ?? .zero
        
        sections[section].headerSize(collectionView: collectionView, section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        sections[safeIndex: section]?.insets(collectionView: collectionView) ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        sections[safeIndex: section]?.interitemSpacing() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sections[safeIndex: section]?.lineSpacing() ?? 0
    }
}

