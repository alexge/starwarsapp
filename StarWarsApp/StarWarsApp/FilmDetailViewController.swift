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
    
    static let film = Film(title: "YES", releaseDate: Date(), characters: ["Han Solo", "Luke Skywalker"], poster: UIImage(named: "puppy2")!, directors: ["George Lucas"], producers: ["Cohen bros"], crawlingText: "It is a period of civil war.\n\nRebel spaceships, striking\n\nfrom a hidden base, have won\n\ntheir first victory against\n\nthe evil Galactic Empire.\n\n\n\nDuring the battle, Rebel\n\nspies managed to steal secret\r\nplans to the Empire's\n\nultimate weapon, the DEATH\n\nSTAR, an armored space\n\nstation with enough power\n\nto destroy an entire planet.\n\n\n\nPursued by the Empire's\n\nsinister agents, Princess\n\nLeia races home aboard her\n\nstarship, custodian of the\n\nstolen plans that can save her\n\npeople and restore\n\nfreedom to the galaxy....")
    
    private var dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateStyle = .medium
        df.dateFormat = "MMMM d, yyyy"
        return df
    }()
    
    var titleLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    var releaseLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    var charactersTitle: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Characters"
        return l
    }()
    
    var charactersLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.numberOfLines = 0
        return l
    }()
    
    var infoStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.alignment = .leading
        return sv
    }()
    
    var crawlingText: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.numberOfLines = 0
        l.textAlignment = .center
        return l
    }()
    
    var crawlingTextTopConstraint: NSLayoutConstraint?
    
    var crawlingView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.heightAnchor.constraint(equalToConstant: 200).isActive = true
        v.clipsToBounds = true
        return v
    }()
    
    init(film: Film) {
        super.init(nibName: nil, bundle: nil)
        
        view.backgroundColor = .white
        
        infoStackView.addArrangedSubview(titleLabel)
        infoStackView.addArrangedSubview(releaseLabel)
        infoStackView.addArrangedSubview(charactersTitle)
        infoStackView.addArrangedSubview(charactersLabel)
        
        view.addSubview(infoStackView)
        view.addSubview(crawlingView)

        infoStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        infoStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        infoStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        crawlingView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        crawlingView.topAnchor.constraint(equalTo: infoStackView.bottomAnchor, constant: 20).isActive = true
        crawlingView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        crawlingView.addSubview(crawlingText)
        crawlingTextTopConstraint = crawlingText.topAnchor.constraint(equalTo: crawlingView.bottomAnchor)
        crawlingTextTopConstraint?.isActive = true
        crawlingText.leadingAnchor.constraint(equalTo: crawlingView.leadingAnchor).isActive = true
        crawlingText.trailingAnchor.constraint(equalTo: crawlingView.trailingAnchor).isActive = true
        
        titleLabel.text = film.title
        let dateString = dateFormatter.string(from: film.releaseDate)
        releaseLabel.text = dateString
        charactersLabel.text = film.characterString()
        crawlingText.text = film.crawlingText
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        crawlText()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func crawlText() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 20, delay: 0, options: .curveLinear, animations: {
            self.crawlingTextTopConstraint?.constant = -self.crawlingText.bounds.height - 200
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
}
