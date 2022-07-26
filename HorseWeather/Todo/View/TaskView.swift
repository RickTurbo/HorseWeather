//
//  TaskView.swift
//  HorseWeather
//
//  Created by 児島　陸斗 on 2022/08/08.
//

import SwiftUI

struct TaskView: View {
    @EnvironmentObject var realmManager: RealmManager
    var body: some View {
        //        ZStack {
        //            Rectangle()
        //                        .foregroundColor(.green.opacity(0.2))
        //            VStack {
        //                Text("Horse Memo")
        //                    .padding()
        //                    .frame(maxWidth: .infinity)
        //                    .font(.custom("Times-Roman", size: 55))
        //                    .padding(.top, 50)
        //
        //                List {
        //                    ForEach(realmManager.tasks, id: \.id) {
        //                        task in
        //                        if !task.isInvalidated {
        //                            TaskRow(task: task.title, completed: task.completed)
        //                                .onTapGesture {
        //                                    realmManager.updateTask(id: task.id, completed: !task.completed)
        //                                }
        //                                .swipeActions(edge: .trailing) {
        //                                    Button(role: .destructive) {
        //                                        realmManager
        //                                            .deleteTask(id: task.id)
        //                                    } label: {
        //                                        Label("Delete", systemImage: "trash")
        //                                    }
        //                                }
        //                        }
        //                    }
        //                    .listRowSeparator(.hidden)
        //                    .listRowBackground(Color.yellow)
        //                }
        //                .onAppear {
        //                    UITableView.appearance().backgroundColor = UIColor.clear
        //                    UITableViewCell.appearance()
        //                        .backgroundColor = UIColor.clear
        //                }
        //            }
        //        }


        VStack {
            Text("Horse Memo")
                .padding()
                .frame(maxWidth: .infinity)
                .font(.custom("Times-Roman", size: 40))
                .padding(.top, 40)

            List {
                ForEach(realmManager.tasks, id: \.id) {
                    task in
                    if !task.isInvalidated {
                        TaskRow(task: task.title, completed: task.completed)
                            .onTapGesture {
                                realmManager.updateTask(id: task.id, completed: !task.completed)
                            }
                            .swipeActions(edge: .trailing) {
                                Button(role: .destructive) {
                                    realmManager
                                        .deleteTask(id: task.id)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                    }
                }
                .listRowSeparator(.hidden)
            }
            .onAppear {
                UITableView.appearance().backgroundColor = UIColor.clear
                UITableViewCell.appearance()
                    .backgroundColor = UIColor.clear
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 0.535, saturation: 0.255, brightness: 0.893))
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
            .environmentObject(RealmManager())
    }
}
