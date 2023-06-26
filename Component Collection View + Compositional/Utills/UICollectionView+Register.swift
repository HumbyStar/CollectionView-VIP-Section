//
//  UICollectionView+Register.swift
//  Component Collection View + Compositional
//
//  Created by Humberto Rodrigues on 24/06/23.
//

import UIKit

extension UICollectionView {
    func register<T: ReusableView>(_: T.Type) {
        self.register(T.self, forCellWithReuseIdentifier: T.identifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(_: T.Type, for indexPath: IndexPath) -> T {
        self.dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as! T
    }
}



//class Banana: UICollectionViewCell {
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        Self.identifier
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//} -----> Código de teste e estudo, exemplo idiota

