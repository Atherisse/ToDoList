//
//  ListRowView.swift
//  ToDoList (iOS)
//
//  Created by user217621 on 6/3/22.
//

import SwiftUI

struct ListRowView: View {
    let item:ItemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
                .font(.title2)
                .padding(.vertical, 8)
            Text(item.title)
            Spacer()
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title:"first", isCompleted: false)
    static var item2 = ItemModel(title:"first2", isCompleted: true)
    
    static var previews: some View {
        Group{
            ListRowView(item:item1)
            ListRowView(item:item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
