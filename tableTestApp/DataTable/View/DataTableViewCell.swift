//
//  DataTableViewCell.swift
//  tableTestApp
//
//  Created by Artem Chursin on 18.10.2019.
//  Copyright © 2019 Artem Chursin. All rights reserved.
//

import UIKit

class DataTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setupCell(name: String?,
                   duration: Int?,
                   countries: String?,
                   age: String?,
                   year: Int?,
                   created: String?,
                   favorites: Int?,
                   genres: String?,
                   actors: String?,
                   description: String?,
                   cellView: FilmCell!) {
        
        guard let filmName = name, let filmDescription = description else {
            return
        }
        
        if let filmYear = year {
            cellView.name.text = filmName + " (\(filmYear))"
        } else {
            cellView.name.text = filmName
        }
        
        if let filmDuration = duration {
            cellView.duration.text = "\(filmDuration) минут"
        } else {
            cellView.duration.text = "Продолжительность:-"
        }
        
        if let filmCountries = countries {
            cellView.countries.text = " Снято в \(filmCountries)"
        } else {
            cellView.countries.text = "Снято в -"
        }
        
        if let filmAge = age {
            cellView.age.text = "Ограничение: \(filmAge)"
        } else {
            cellView.age.text = "Ограничение: -"
        }
        
        if let filmFavorits = favorites {
            cellView.favorits.text = "В избранном: \(filmFavorits)"
        } else {
            cellView.favorits.text = "В избранном: -"
        }

        if let filmCreates = created {
            cellView.created.text = filmCreates
        } else {
            cellView.created.text = "-"
        }
        
        if let filmGenres = genres {
            cellView.genres.text = "Жанр: \(filmGenres)"
        } else {
            cellView.genres.text = "Жанр: -"
        }
        
        if let filmActors = actors {
            cellView.actors.text = "В ролях: \(filmActors)"
        } else {
            cellView.actors.text = "В ролях: -"
        }
        
        cellView.fimDescription.text = filmDescription
        
        
    }
    
}
