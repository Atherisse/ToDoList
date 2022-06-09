//
//  ListViewModel.swift
//  ToDoList (iOS)
//
//  Created by user217621 on 6/7/22.
//

//viewmodels contain the logic

import Foundation

class ListViewModel: ObservableObject{
    @Published var items:[ItemModel] = []
    let itemKey: String = "items_list"

    //when this class is instanced, the first thing it does is to call the getItems function
    init(){
       getItems()
    }
    
    func getItems(){ //this function adds 3 hard coded instances of ItemModel model, to our items array ln13
       
        guard
            let data = UserDefaults.standard.data(forKey: itemKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = savedItems
        
    }
    
    func deleteItem(indexSet: IndexSet){ // allows us to remove specific elements from the items array
        items.remove(atOffsets:indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int){ //alows us to move elements to different location inside the items array
        items.move(fromOffsets:from, toOffset: to)
    }
    
    func addItem(title:String){//allows us to add a new ItemModel instance to our items array
        let newItem = ItemModel(title:title, isCompleted: false)
        items.append(newItem)
    }
    
    func textIsAppropriate(_ text:String) -> Bool { //checks whether our title for our ToDoList Item is appropriate or not
        if(text.count > 3){
            return true
        }
        return false
    }
    
}
