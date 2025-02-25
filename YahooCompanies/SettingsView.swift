//
//  Settings.swift
//  YahooCompanies
//
//  Created by Sergii D on 2/25/25.
//

import SwiftUI

struct SortByItemView: View {
    let isSelected: Bool
    let title: String

    var body: some View {
        Text(title)
            .padding(2)
            .background(isSelected ? .blue : .gray)
            .cornerRadius(4)
    }
}

struct SettingsView: View {
    @Binding var sortByName: Bool
    
    var body: some View {
        HStack {
            Text("Sort by:")
            SortByItemView(isSelected: sortByName, title: "Name")
                .onTapGesture {
                    sortByName.toggle()
                }
            SortByItemView(isSelected: !sortByName, title: "Cap")
                .onTapGesture {
                    sortByName.toggle()
                }
        }
    }
}

#Preview {
    @Previewable @State var sortByName = true
    SettingsView(sortByName: $sortByName)
}
