//
//  CarDetailsView.swift
//  ListsAndNavigation
//
//  Created by Tzuzul Rosas on 15/02/22.
//

import SwiftUI

struct CarDetailsView: View {
    var selectedCar:Car
    var body: some View {
        Form{
            Section(header: Text("Car Details")) {

                Image(selectedCar.image)

                    .resizable()

                    .cornerRadius(12.0)

                    .aspectRatio(contentMode: .fit)

                    

                    Text(selectedCar.name)

                        .font(.headline)

            

                    Text(selectedCar.description)

                        .font(.body)


            }
        }
    }
}

struct CarDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CarDetailsView(selectedCar: Car(id: "a1", name: "Tesla", description: "Descripción del auto", image: "tesla1"))
    }
}
