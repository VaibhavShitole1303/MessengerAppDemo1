//
//  InBoxRowView.swift
//  MessengerAppDemo
//
//  Created by Neosao Services on 18/04/24.
//

import SwiftUI

struct InBoxRowView: View {
    var body: some View {
        HStack(alignment: .top,spacing: 12){
            CircularProfileImageView(user: User.MOCK_USER, size: .medium)
            VStack(alignment: .leading,spacing: 4){
                Text("Heath Ledger")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text("some message some message some message")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                    .lineLimit(2)
                    .frame(maxWidth: UIScreen.main.bounds.width - 100 , alignment: .leading) // we added this because its shold not go and overlap on date text view
                
            }
            HStack{Text("Today")
                Image(systemName: "chevron.right")
            }
            .font(.footnote)
            .foregroundColor(.gray)
        }
        .frame(height: 72)
    }
}

#Preview {
    InBoxRowView()
}
