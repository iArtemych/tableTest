//
//  DataTableViewCell.swift
//  tableTestApp
//
//  Created by Artem Chursin on 18.10.2019.
//  Copyright © 2019 Artem Chursin. All rights reserved.
//

import UIKit

class DataTableViewCell: UITableViewCell {
    
    func setupCell(film: Films, cellView: inout FilmCell!) {
        
        for view in self.contentView.subviews {
            view.removeFromSuperview()
        }
        
        cellView = FilmCell.loadFromNib()
        self.contentView.addSubview(cellView)
        cellView.translatesAutoresizingMaskIntoConstraints = false

        if let cellData = cellView {

            let verticalSpaceTop = NSLayoutConstraint(item: cellData, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0)
            let verticalSpaceBottom = NSLayoutConstraint(item: cellData, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0)
            let horisontalSpaceTrailing = NSLayoutConstraint(item: cellData, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0)
            let horisontalSpaceLeading = NSLayoutConstraint(item: cellData, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0)

            NSLayoutConstraint.activate([verticalSpaceTop, verticalSpaceBottom, horisontalSpaceLeading, horisontalSpaceTrailing])
        }
        guard let filmName = film.name, let filmDescription = film.description else {
            return
        }
        
        if let filmYear = film.year {
            cellView.name.text = filmName + " (\(filmYear))"
        } else {
            cellView.name.text = filmName
        }
        
        if let filmDuration = film.duration {
            cellView.duration.text = "\(filmDuration) минут"
        } else {
            cellView.duration.text = "Продолжительность:-"
        }
        
        if let filmCountries = film.countries {
            cellView.countries.text = " Снято в \(filmCountries)"
        } else {
            cellView.countries.text = "Снято в -"
        }
        
        if let filmAge = film.age {
            cellView.age.text = "Ограничение: \(filmAge)"
        } else {
            cellView.age.text = "Ограничение: -"
        }
        
        if let filmFavorits = film.favorites {
            cellView.favorits.text = "В избранном: \(filmFavorits)"
        } else {
            cellView.favorits.text = "В избранном: -"
        }

        if let filmCreates = film.created {
            cellView.created.text = filmCreates
        } else {
            cellView.created.text = "-"
        }
        
        if let filmGenres = film.genres {
            cellView.genres.text = "Жанр: \(filmGenres)"
        } else {
            cellView.genres.text = "Жанр: -"
        }
        
        if let filmActors = film.actors {
            cellView.actors.text = "В ролях: \(filmActors)"
        } else {
            cellView.actors.text = "В ролях: -"
        }
        
        cellView.fimDescription.text = filmDescription
        
        
    }
    
}
