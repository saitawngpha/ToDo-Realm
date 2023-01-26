//
//  ToDoListRow.swift
//  ToDos Realm
//
//  Created by Steve Pha on 1/24/23.
//

import SwiftUI
import RealmSwift

struct ToDoListRow: View {
    
    @ObservedRealmObject var toDo: ToDo
    
    var body: some View {
        HStack{
            Button{
                $toDo.completed.wrappedValue.toggle()
            }label: {
                Image(systemName: toDo.completed ? "checkmark.circle" : "circle")
            }
            .buttonStyle(.plain)
             //textfield
            TextField("Update Todos", text: $toDo.name)
                .textFieldStyle(.roundedBorder)
            Spacer()
            
            Button{
                $toDo.urgency.wrappedValue = toDo.increment()
            }label: {
                Text(toDo.urgency.text)
                    .padding(5)
                    .frame(width: 80)
                    .foregroundColor(Color(.systemBackground))
                    .background(RoundedRectangle(cornerRadius: 10).fill(toDo.urgency.color))
            }
            .buttonStyle(.plain)
            
        }//end hstack
        .padding(.horizontal)
    }
}

struct ToDoListRow_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListRow(toDo: ToDo(name: "Make the bed"))
    }
}
