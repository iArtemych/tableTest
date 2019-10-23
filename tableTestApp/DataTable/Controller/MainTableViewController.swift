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
    let filmsResponce = FilmsResponce()
    
    //MARK: - Variables
    private var filmsArray: [Films] = []
    private var selectedArray: [Films] = []
    var page = 1 {
        didSet {
            mainView.pagePanel.setupNumPad(page: page, maxPage: maxPage)
            filmListFrommArray()
        }
    }
    private var maxPage = 0
    var rowHeight: CGFloat = 414.0
    
    //MARK: - Outlets
    @IBOutlet var mainView: MainView!
    
    //MARK: - LifeStyle ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.dataTable.dataSource = self
        mainView.dataTable.delegate = self
        mainView.pagePanel.delegate = self
        mainView.dataTable.register(DataTableViewCell.self, forCellReuseIdentifier: "dataCell")
        
        filmsArray = filmsResponce.getData()
        
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
}


extension MainTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let maxFilmCount = 10
        
        return maxFilmCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath) as! DataTableViewCell
        let film = selectedArray[indexPath.row]
        var cellView: FilmCell!
        
        cell.setupCell(film: film, cellView: &cellView)
        
        return cell
    }
}

extension MainTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        return rowHeight
    }
    
}


