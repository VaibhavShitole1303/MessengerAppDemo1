//
//  NewMessageView.swift
//  MessengerAppDemo
//
//  Created by Neosao Services on 18/04/24.
//

import SwiftUI

struct NewMessageView: View {
    @State private var searchText = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            ScrollView{
                TextField("To : ", text: $searchText)
                    .frame(height: 44)
                    .padding(.leading)
                    .background(Color(.systemGroupedBackground))
                
                Text("Contacts")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                ForEach(0 ... 10 ,id: \.self){
                    user in
                    VStack {
                        HStack {
                            CircularProfileImageView(user: User.MOCK_USER, size: .small)
                            Text("Vaibhav")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            Spacer()
                        }
                        .padding(.leading)
                        Divider()
                            .padding(.leading ,45)
                    }
                }
            }
            .navigationTitle("New Message")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button("Cancle"){
                        dismiss()
                    }
                    .foregroundColor(.black)
                    
                }
        }
        }
    }
}

#Preview {
    NavigationStack{
        NewMessageView()
    }
   
}
