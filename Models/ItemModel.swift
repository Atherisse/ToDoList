//
//  ItemModel.swift
//  ToDoList (iOS)
//
//  Created by user217621 on 6/7/22.
//

//everything that has to do with data goes into this model, this includes DATA VALIDATION

import Foundation

struct ItemModel: Identifiable {
    let id:String = UUID().uuidString
    let title:String
    let isCompleted:Bool
    
    //when working with a database, this model needs ot have crud functions
    //and data validation
}
