//
//  LoadingViewController.swift
//  StarWarsApp
//
//  Created by Alexander Ge on 8/31/18.
//  Copyright © 2018 G Dev. All rights reserved.
//

import Foundation
import UIKit

protocol LoadingViewControllerDelegate: class {
    func loadingViewControllerDidFinishLoading(films: [Film])
}

class LoadingViewController: UIViewController {
    weak var delegate: LoadingViewControllerDelegate?
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    private var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.isHidden = true
        runTimer()
        
        let requestPerformer = RequestPerformer()
        requestPerformer.downloadAllFilms { films in
            guard let films = films else {
                return
            }
            self.delegate?.loadingViewControllerDidFinishLoading(films: films)
        }
    }
    
    private func runTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
            self.activityIndicator.startAnimating()
            self.activityIndicator.isHidden = false
        }
    }
}

