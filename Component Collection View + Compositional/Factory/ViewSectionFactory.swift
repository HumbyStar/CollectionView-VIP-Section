//
//  Factory.swift
//  Component Collection View + Compositional
//
//  Created by Humberto Rodrigues on 24/06/23.
//

import Foundation

class ViewSectionFactory {
    static func makeSections(for delegate: View) -> [SectionProtocol] {
        let sections: [SectionProtocol?] = [
            setupBannerHomeSections(delegate: delegate)
        ]
        
        return sections.compactMap({$0})
    }
    
    static func setupBannerHomeSections(delegate: BannerHomeSectionDelegate) -> BannerHomeSection {
        let section = BannerHomeSection.configureView()
        section.delegate = delegate
        return section
    }
}
