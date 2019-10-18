//
//  ViewController.swift
//  tableTestApp
//
//  Created by Artem Chursin on 18.10.2019.
//  Copyright © 2019 Artem Chursin. All rights reserved.
//

import UIKit

class MainTableViewController: UIViewController {
    
    //MARK: - Constants
    
    //MARK: - Variables
    private var filmsArray: [Films] = []
    private var selectedArray: [Films] = []
    var page = 1 {
        didSet {
            mainView.pagePanel.setupNumPad(page: page, maxPage: maxPage)
            filmListFrommArray()
        }
    }
    var maxPage = 0
    //MARK: - Outlets
    @IBOutlet var mainView: MainView!
    
    //MARK: - LifeStyle ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.dataTable.dataSource = self
        mainView.dataTable.delegate = self
        mainView.pagePanel.delegate = self
        mainView.dataTable.register(DataTableViewCell.self, forCellReuseIdentifier: "dataCell")
        
        getData()
        pageCount()
        mainView.pagePanel.setupNumPad(page: 1, maxPage: maxPage)
        filmListFrommArray()
    }
    
    //MARK: - Private methods
    private func pageCount() {

        if filmsArray.count%10 == 0 {
            maxPage = filmsArray.count / 10
        } else {
            maxPage = filmsArray.count / 10 + 1
        }

    }
    
    private func filmListFrommArray() {
        
        let beginPage = (page - 1) * 10
        let finalFilm = beginPage + 9
        selectedArray = []
        for (index, film) in filmsArray.enumerated() {
            if index >= beginPage && index <= finalFilm {
                selectedArray.append(film)
            }
        }
        mainView.dataTable.scroll(to: .top, animated: true)
        mainView.dataTable.reloadData()
    }
    
    private func getData() {
        
        let data: Data
        
        guard let file = Bundle.main.url(forResource: "jsonFilms.json", withExtension: nil)
            else {
                fatalError("Couldn't find jsonFilms in main bundle.")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load jsonFilms from main bundle")
        }
        
        do {
            let decoder = JSONDecoder()
            let films = try decoder.decode([Films].self, from: data)
            filmsArray = films
        } catch {
            fatalError("Couldn't parse jsonFilms as")
        }
        
    }

}

extension MainTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath) as! DataTableViewCell
        
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        
        var cellView: FilmCell!
        cellView = FilmCell.loadFromNib()
        cell.contentView.addSubview(cellView)
        cellView.translatesAutoresizingMaskIntoConstraints = false

        if let cellData = cellView {

            let verticalSpaceTop = NSLayoutConstraint(item: cellData, attribute: .top, relatedBy: .equal, toItem: cell, attribute: .top, multiplier: 1, constant: 0)
            let verticalSpaceBottom = NSLayoutConstraint(item: cellData, attribute: .bottom, relatedBy: .equal, toItem: cell, attribute: .bottom, multiplier: 1, constant: 0)
            let horisontalSpaceTrailing = NSLayoutConstraint(item: cellData, attribute: .trailing, relatedBy: .equal, toItem: cell, attribute: .trailing, multiplier: 1, constant: 0)
            let horisontalSpaceLeading = NSLayoutConstraint(item: cellData, attribute: .leading, relatedBy: .equal, toItem: cell, attribute: .leading, multiplier: 1, constant: 0)

            NSLayoutConstraint.activate([verticalSpaceTop, verticalSpaceBottom, horisontalSpaceLeading, horisontalSpaceTrailing])
        }
        
        let film = selectedArray[indexPath.row]
        cell.setupCell(name: film.name, duration: film.duration, countries: film.countries, age: film.age, year: film.year, created: film.created, favorites: film.favorites, genres: film.genres, actors: film.actors, description: film.description, cellView: cellView)
        
        return cell
    }
    
    
}

extension MainTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 414
    }
    
}


