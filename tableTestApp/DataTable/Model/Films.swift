//
//  Films.swift
//  tableTestApp
//
//  Created by Artem Chursin on 18.10.2019.
//  Copyright © 2019 Artem Chursin. All rights reserved.
//

import Foundation

struct Films: Codable {
    let countries : String?
    let duration : Int?
    let partner : String?
    let actors : String?
    let image : String?
    let contentGroupPtr : Int?
    let favorites : Int?
    let adult : Int?
    let description : String?
    let genres : String?
    let year : Int?
    let contentTypePtr : Int?
    let partnerPath : String?
    let added : String?
    let id : Int?
    let locked : Int?
    let name : String?
    let comments : String?
    let director : String?
    let created : String?
    let age : String?
    let status : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case countries = "countries"
        case duration = "duration"
        case partner = "partner"
        case actors = "actors"
        case image = "image"
        case contentGroupPtr = "content_group_ptr"
        case favorites = "favorites"
        case adult = "adult"
        case description = "description"
        case genres = "genres"
        case year = "year"
        case contentTypePtr = "content_type_ptr"
        case partnerPath = "partner_path"
        case added = "added"
        case id = "id"
        case locked = "locked"
        case name = "name"
        case comments = "comments"
        case director = "director"
        case created = "created"
        case age = "age"
        case status = "status"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        countries = try values.decodeIfPresent(String.self, forKey: .countries)
        duration = try values.decodeIfPresent(Int.self, forKey: .duration)
        partner = try values.decodeIfPresent(String.self, forKey: .partner)
        actors = try values.decodeIfPresent(String.self, forKey: .actors)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        contentGroupPtr = try values.decodeIfPresent(Int.self, forKey: .contentGroupPtr)
        favorites = try values.decodeIfPresent(Int.self, forKey: .favorites)
        adult = try values.decodeIfPresent(Int.self, forKey: .adult)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        genres = try values.decodeIfPresent(String.self, forKey: .genres)
        year = try values.decodeIfPresent(Int.self, forKey: .year)
        contentTypePtr = try values.decodeIfPresent(Int.self, forKey: .contentTypePtr)
        partnerPath = try values.decodeIfPresent(String.self, forKey: .partnerPath)
        added = try values.decodeIfPresent(String.self, forKey: .added)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        locked = try values.decodeIfPresent(Int.self, forKey: .locked)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        comments = try values.decodeIfPresent(String.self, forKey: .comments)
        director = try values.decodeIfPresent(String.self, forKey: .director)
        created = try values.decodeIfPresent(String.self, forKey: .created)
        age = try values.decodeIfPresent(String.self, forKey: .age)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
    }
    
}
