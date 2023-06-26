//
//  SectionProtocol.swift
//  Component Collection View + Compositional
//
//  Created by Humberto Rodrigues on 24/06/23.
//

import UIKit

public protocol SectionProtocol {
    func fetch()
    
    func register(at collectionView: UICollectionView)
    
    func numberOfItems() -> Int
    
    func lineSpacing() -> CGFloat
    
    func interitemSpacing() -> CGFloat
    
    func insets(collectionView: UICollectionView) -> UIEdgeInsets
    
    func didSelectItem(at indexPath: IndexPath)
    
    func cellForItem(at indexPath: IndexPath, collectionView: UICollectionView) -> UICollectionViewCell
    
    func headerView(at indexPath: IndexPath, collectionView: UICollectionView) -> UICollectionReusableView
    
    func headerSize(collectionView: UICollectionView, section: Int) -> CGSize
    
    func footerView(at indexPath: IndexPath, collectionView: UICollectionView) -> UICollectionReusableView
    
    func footerSize(collectionView: UICollectionView, section: Int) -> CGSize
    
    func willDisplay(at indexPath: IndexPath, collectionView: UICollectionView, cell: UICollectionViewCell)
    
    func layoutSection() -> NSCollectionLayoutSection?
}

public extension SectionProtocol {
    func numberOfItems() -> Int { return 0 }
    
    func lineSpacing() -> CGFloat { return 0 }
    
    func interitemSpacing() -> CGFloat { return 0 }
    
    func insets(collectionView: UICollectionView) -> UIEdgeInsets { return .zero }
    
    func didSelectItem(at indexPath: IndexPath) { }
    
    func cellForItem(at indexPath: IndexPath, collectionView: UICollectionView) -> UICollectionViewCell { return UICollectionViewCell() }
    
    func headerView(at indexPath: IndexPath, collectionView: UICollectionView) -> UICollectionReusableView { return UICollectionReusableView() }
    
    func headerSize(collectionView: UICollectionView, section: Int) -> CGSize { return .zero }
    
    func footerView(at indexPath: IndexPath, collectionView: UICollectionView) -> UICollectionReusableView { return UICollectionReusableView() }
    
    func footerSize(collectionView: UICollectionView, section: Int) -> CGSize { return .zero }
    
    func willDisplay(at indexPath: IndexPath, collectionView: UICollectionView, cell: UICollectionViewCell) { }
    
    func fetch() { }
}

