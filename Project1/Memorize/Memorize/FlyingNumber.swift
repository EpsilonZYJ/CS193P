//
//  FlyingNumber.swift
//  Memorize
//
//  Created by 周煜杰 on 2025/2/2.
//

import SwiftUI

struct FlyingNumber: View {
    let number: Int
    
    var body: some View {
        if number != 0{
            Text(number, format: .number)
        }
    }
}

#Preview {
    FlyingNumber(number: 5)
}
