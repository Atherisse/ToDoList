//
//  ItemModel.swift
//  ToDoList (iOS)
//
//  Created by user217621 on 6/7/22.
//

//everything that has to do with data goes into this model, this includes DATA VALIDATION

import Foundation

//immutable struct

struct ItemModel: Identifiable, Codable {
    let id:String
    let title:String
    let isCompleted:Bool
    
    //making id optional at init
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool){
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    //returns an ItemModel which already has an existing UUID
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
    
    //when working with a database, this model needs ot have crud functions
    //and data validation
}
