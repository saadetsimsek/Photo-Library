//
//  PostItemModel.swift
//  PhotoLibrary
//
//  Created by Saadet Şimşek on 30/04/2025.
//

import Foundation

class PostDate: Identifiable {
    let id = UUID()
    let items: [PostItemModel]
    let date: Date
    
    init(items: [PostItemModel], date: Date) {
        self.items = items
        self.date = date
    }
    
    static func getMockData() -> [PostDate] {
        [
            PostDate(items: [
                PostItemModel(photos: ["img1", "img2"],
                              comments: nil,
                              tag: ["Home", "Nature"],
                              description: "this amazing landspace",
                              date: Date()),
                PostItemModel(photos: ["img3"],
                              comments: nil,
                              tag: ["home", "Nature", "Education", "Work"],
                              description: "this kdlckadmkkfdnvkfd",
                              date: Date()),
                PostItemModel(photos: ["img2"],
                              comments: nil,
                              tag: ["Home", "Nature"],
                              description: "this ajahedefebrfhrbhf",
                              date: Date()),
            ], date: Date()),
            
            PostDate(items: [
                PostItemModel(photos: ["img3"],
                              comments: nil,
                              tag: ["home", "Nature", "Education", "Work"],
                              description: "kadmkfnanfjn bcdhfbhdf dfhfdhfsb hfbhdbfh",
                              date: Date()),
                PostItemModel(photos: ["img1"],
                              comments: nil,
                              tag: ["Home", "Nature"],
                              description: "hfhrewh dhfbhedfbhre dhgfgfyrgf hdhfgrgfrdhgf",
                              date: Date()),
            ], date: Date().addingTimeInterval(-86400)),
            
            PostDate(items: [
                PostItemModel(photos: ["img3", "img1"],
                              comments: nil,
                              tag: ["home", "Nature", "Education", "Work"],
                              description: "this kdlckadmkkfdnvkfd",
                              date: Date()),
                PostItemModel(photos: ["img2"],
                              comments: nil,
                              tag: ["Home", "Nature"],
                              description: "this ajahedefebrfhrbhf",
                              date: Date()),
            ], date: Date().addingTimeInterval(-172800))
        ]
    }
}

class PostItemModel: Identifiable {
    let id = UUID().uuidString
    let photos : [String]
    let comments : [Commet]?
    let tag: [String]?
    let description: String?
    let isFavorite: Bool
    let date: Date
    
    init(photos: [String], comments: [Commet]?, tag: [String]?, description: String?,
         isFavorite: Bool = false, date: Date) {
        self.photos = photos
        self.comments = comments
        self.tag = tag
        self.description = description
        self.isFavorite = isFavorite
        self.date = date
    }
    
    static func getMockItems() -> [PostItemModel]{
        [
            PostItemModel(photos: ["img3", "img1"],
                          comments: nil,
                          tag: ["home", "Nature", "Education", "Work"],
                          description: "jdhfdfhd dshfhdhfghds selam jshdhgesf jsdhhsgf jhfjd",
                          isFavorite: true,
                          date: Date()),
            PostItemModel(photos: ["img2", "img1"],
                          comments: nil,
                          tag: ["home", "Nature", "Education", "Work"],
                          description: "çay stanley jdhfdfhd dshfhdhfghds selam jshdhgesf jsdhhsgf jhfjd",
                          isFavorite: true,
                          date: Date()),
            PostItemModel(photos: ["img3", "img2"],
                          comments: nil,
                          tag: ["home", "Work"],
                          description: "hey seçtik skıjdshcjd jdhfdfhd dshfhdhfghds selam jshdhgesf jsdhhsgf jhfjd",
                          isFavorite: true,
                          date: Date()),
            PostItemModel(photos: ["img2", "img1"],
                          comments: nil,
                          tag: [ "Education", "Work"],
                          description: "üçüncü hey sjdjs skjdkdsjfhsgf jhfjd",
                          isFavorite: true,
                          date: Date().addingTimeInterval(-172800)),
            PostItemModel(photos: ["img2", "img1"],
                          comments: nil,
                          tag: [ "Education", "Work"],
                          description: "üçüncü hey sjdjs skjdkdsjfhsgf jhfjd",
                          isFavorite: true,
                          date: Date().addingTimeInterval(-86400)),
            PostItemModel(photos: ["img2", "img1"],
                          comments: nil,
                          tag: [ "Education", "Work"],
                          description: "üçüncü hey sjdjs skjdkdsjfhsgf jhfjd",
                          isFavorite: true,
                          date: Date().addingTimeInterval(-172800)),
            
        ]
    }
}
 
class Commet: Identifiable {
    let id = UUID().uuidString
    let date: Date
    let comment: String
    
    init(date: Date, comment: String) {
        self.date = date
        self.comment = comment
    }
}

/*
[
    [
        header
        [item1, item2]
    ],
    [
        header
        [item1, item2]
    ],
    [
        header
        [item1, item2]
    ],
]
*/
  

