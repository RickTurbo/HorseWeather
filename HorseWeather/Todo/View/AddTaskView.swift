//
//  AddTaskView.swift
//  HorseWeather
//
//  Created by 児島　陸斗 on 2022/08/08.
//

import SwiftUI

struct AddTaskView: View {
    @EnvironmentObject var realmManager: RealmManager
    @State private var title: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack (alignment: .leading, spacing: 20) {
            Text("競馬メモを追加")
                .font(.title3).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
//            TextField("メモを入力して下さい", text: $title)
//                .textFieldStyle(.roundedBorder)

            TextEditor(text: $title)
                .textFieldStyle(.roundedBorder)
                .frame(width: 350, height: 70)


            Button {
                if title != "" {
                    realmManager.addTask(taskTitle: title)
                }
                dismiss()
            } label: {
                Text("メモを追加")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Color(hue: 0.328, saturation: 0.535, brightness: 0.722))
                    .cornerRadius(30)
            }
            Spacer()
        }
        .padding(.top, 40)
        .padding(.horizontal)
        .background(Color(hue: 0.535, saturation: 0.255, brightness: 0.893))
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
            .environmentObject(RealmManager())
    }
}
