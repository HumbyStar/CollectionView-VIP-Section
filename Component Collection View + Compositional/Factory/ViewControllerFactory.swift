//
//  ViewControllerFactory.swift
//  Component Collection View + Compositional
//
//  Created by Humberto Rodrigues on 24/06/23.
//

import Foundation

class ViewControllerFactory {
    static func make() -> ViewController {
        let view = View()
        let sections = ViewSectionFactory.makeSections(for: view)
        let viewController = ViewController(screenView: view)
        view.setSections(sections)
        return viewController
    }
}
