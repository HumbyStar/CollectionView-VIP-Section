//
//  ViewController.swift
//  Component Collection View + Compositional
//  Created by Humberto Rodrigues on 24/06/23.

import UIKit

class ViewController: UIViewController {
    
    var screenView: View
    
    init(screenView: View) {
        self.screenView = screenView
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        screenView.loadSections()
        self.view.backgroundColor = .yellow
    }
    
    override func loadView() {
        view = screenView
    }

    

}

