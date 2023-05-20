//
//  ContentView.swift
//  ToDo_App
//
//  Created by Himanshu Dawar on 20/05/23.
//

import SwiftUI

struct ContentView: View {
    @State var todos:[ToDo] = [ToDo]()
    @State var task:String = ""
    
    var body: some View {
        NavigationView{
            VStack{
                TextField("add to do",text: $task,onCommit: addToDo)
                    .padding()
                List{
                    ForEach(todos){todo in
                        Text(todo.name)
                    }
                .onDelete(perform: deleteToDo)
                }
            }
            .navigationBarTitle("To Do",displayMode: .inline)
        }
    }
    
//    MARK: Add to do Task
    private func addToDo(){
        todos.append(ToDo(name: task))
        task = ""
    }
    
//    MARK: Remove to do Task
    private func deleteToDo(at offsets:IndexSet){
        todos.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
