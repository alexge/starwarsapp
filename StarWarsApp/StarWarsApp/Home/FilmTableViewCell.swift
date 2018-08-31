//
//  FilmTableViewCell.swift
//  StarWarsApp
//
//  Created by Alexander Ge on 8/31/18.
//  Copyright © 2018 G Dev. All rights reserved.
//

import Foundation
import UIKit

class FilmTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "FilmTableViewCell"
    
    private var contentStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.alignment = .leading
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.spacing = 15
        return sv
    }()
    
    private var posterView: UIImageView = {
        let pv = UIImageView()
        pv.translatesAutoresizingMaskIntoConstraints = false
        pv.widthAnchor.constraint(equalToConstant: 150).isActive = true
        pv.heightAnchor.constraint(equalToConstant: 300).isActive = true
        pv.contentMode = .scaleAspectFit
        return pv
    }()
    
    private var infoStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.alignment = .leading
        sv.spacing = 10
        return sv
    }()
    
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
    
    private var directorTitleLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Directed by"
        return l
    }()
    
    private var directorsLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    private var directorStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.alignment = .leading
        sv.spacing = 5
        return sv
    }()
    
    private var producerTitleLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Produced by"
        return l
    }()
    
    private var producersLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    private var producerStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.alignment = .leading
        sv.spacing = 5
        return sv
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(contentStackView)
        configureStackViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureStackViews() {
        directorStackView.addArrangedSubview(directorTitleLabel)
        directorStackView.addArrangedSubview(directorsLabel)
        producerStackView.addArrangedSubview(producerTitleLabel)
        producerStackView.addArrangedSubview(producersLabel)
        
        infoStackView.addArrangedSubview(titleLabel)
        infoStackView.addArrangedSubview(releaseLabel)
        infoStackView.addArrangedSubview(directorStackView)
        infoStackView.addArrangedSubview(producerStackView)
        
        contentStackView.addArrangedSubview(posterView)
        contentStackView.addArrangedSubview(infoStackView)
        
        contentStackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        contentStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        contentStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        contentStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        posterView.image = nil
        titleLabel.text = nil
        releaseLabel.text = nil
        directorsLabel.text = nil
        producersLabel.text = nil
    }
    
    func bind(film: Film) {
        posterView.image = film.poster
        titleLabel.text = film.title
        releaseLabel.text = film.releaseDate
        directorsLabel.text = film.directors
        producersLabel.text = film.producers
    }
    
}
