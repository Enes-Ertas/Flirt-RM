//
//  TopNavigationBar.swift
//  Flirt-RM
//
//  Created by Enes Ertaş on 24.05.2025.
//

import SwiftUI

struct TopNavigationBar: View {
    var body: some View {
        HStack {
            Image("profile_photo") // Assets'e eklediğin küçük yuvarlak profil resmi
                .resizable()
                .scaledToFill()
                .frame(width: 32, height: 32)
                .clipShape(Circle())

            Spacer()

            Text("FlirtMate")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)

            Spacer()

            Image(systemName: "line.horizontal.3")
                .font(.system(size: 24))
                .foregroundColor(.white)
        }
        .padding(.horizontal, 20)
        .padding(.top, 4)
    }
}
