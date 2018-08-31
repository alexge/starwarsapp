//
//  FilmDetailViewController.swift
//  StarWarsApp
//
//  Created by Alexander Ge on 8/30/18.
//  Copyright © 2018 G Dev. All rights reserved.
//

import Foundation
import UIKit

class FilmDetailViewController: UIViewController {
    
    private var titleLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    private var releaseLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    private var charactersTitle: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Characters"
        return l
    }()
    
    private var charactersLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.numberOfLines = 0
        return l
    }()
    
    private var infoStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.alignment = .leading
        return sv
    }()
    
    private var crawlingText: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.numberOfLines = 0
        l.textAlignment = .center
        return l
    }()
    
    private var crawlingTextTopConstraint: NSLayoutConstraint?
    
    private var crawlingView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.heightAnchor.constraint(equalToConstant: 200).isActive = true
        v.clipsToBounds = true
        // perspective transform for opening sequence effect
        var transform = CATransform3DIdentity
        transform.m34 = 1.0 / 500.0
        transform = CATransform3DRotate(transform, -CGFloat(45 * Double.pi / 180), 1, 0, 0)
        v.layer.transform = transform
        return v
    }()
    
    init(film: Film) {
        super.init(nibName: nil, bundle: nil)
        
        view.backgroundColor = .white
        view.addSubview(infoStackView)
        view.addSubview(crawlingView)

        configureInfoStackView()
        configureCrawlingTextView()
        
        titleLabel.text = film.title
        releaseLabel.text = film.releaseDate
        charactersLabel.text = film.characterString()
        crawlingText.text = film.crawlingText
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureInfoStackView() {
        infoStackView.addArrangedSubview(titleLabel)
        infoStackView.addArrangedSubview(releaseLabel)
        infoStackView.addArrangedSubview(charactersTitle)
        infoStackView.addArrangedSubview(charactersLabel)
        
        infoStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        infoStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        infoStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
    
    private func configureCrawlingTextView() {
        crawlingView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        crawlingView.topAnchor.constraint(equalTo: infoStackView.bottomAnchor, constant: 20).isActive = true
        crawlingView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        crawlingView.addSubview(crawlingText)
        crawlingTextTopConstraint = crawlingText.topAnchor.constraint(equalTo: crawlingView.bottomAnchor)
        crawlingTextTopConstraint?.isActive = true
        crawlingText.leadingAnchor.constraint(equalTo: crawlingView.leadingAnchor).isActive = true
        crawlingText.trailingAnchor.constraint(equalTo: crawlingView.trailingAnchor).isActive = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        crawlText()
    }
    
    private func crawlText() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 20, delay: 0, options: .curveLinear, animations: {
            self.crawlingTextTopConstraint?.constant = -self.crawlingText.bounds.height - 200
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
}
