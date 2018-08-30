//
//  HomeViewController.swift
//  StarWarsApp
//
//  Created by Alexander Ge on 8/30/18.
//  Copyright © 2018 G Dev. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(FilmTableViewCell.self, forCellReuseIdentifier: FilmTableViewCell.reuseIdentifier)
        return tv
    }()
    
    private var dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateStyle = .medium
        df.dateFormat = "MMMM d, yyyy"
        return df
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        title = "Films"
        configureTableView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tableView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(FilmDetailViewController(film: FilmDetailViewController.film), animated: true)
//        present(FilmDetailViewController(film: FilmDetailViewController.film), animated: true, completion: nil)
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FilmTableViewCell.reuseIdentifier) as! FilmTableViewCell
        let film = Film(title: "YES", releaseDate: Date(), characters: ["Han Solo", "Luke Skywalker"], poster: UIImage(named: "puppy2")!, directors: ["George Lucas"], producers: ["Cohen bros"], crawlingText: "hi")
        cell.bind(film: film, dateFormatter: dateFormatter)
        return cell
    }
}

class FilmTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "FilmTableViewCell"
    
    var contentStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.alignment = .leading
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.spacing = 15
        return sv
    }()
    
    var posterView: UIImageView = {
        let pv = UIImageView()
        pv.translatesAutoresizingMaskIntoConstraints = false
        pv.widthAnchor.constraint(equalToConstant: 150).isActive = true
        pv.heightAnchor.constraint(equalToConstant: 300).isActive = true
        pv.contentMode = .scaleAspectFit
        return pv
    }()
    
    var infoStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.alignment = .leading
        sv.spacing = 10
        return sv
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
    
    var directorTitleLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Directed by"
        return l
    }()
    
    var directorsLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    var directorStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.alignment = .leading
        sv.spacing = 5
        return sv
    }()
    
    var producerTitleLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Produced by"
        return l
    }()
    
    var producersLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    var producerStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.alignment = .leading
        sv.spacing = 5
        return sv
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureStackViews()
        contentView.addSubview(contentStackView)
        contentStackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        contentStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        contentStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        contentStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
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
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        posterView.image = nil
        titleLabel.text = nil
        releaseLabel.text = nil
        directorsLabel.text = nil
        producersLabel.text = nil
    }
    
    func bind(film: Film, dateFormatter: DateFormatter) {
        posterView.image = film.poster
        titleLabel.text = film.title
        let dateString = dateFormatter.string(from: film.releaseDate)
        releaseLabel.text = dateString
        directorsLabel.text = film.directorString()
        producersLabel.text = film.producerString()
    }
    
}



