//
//  FormView.swift
//  CarOrderForm
//
//  Created by Tzuzul Rosas on 24/02/22.
//

import SwiftUI

struct FormView: View {
    
    @StateObject var testProperties: TestProperties = TestProperties()
    
    @State var saveForm:Bool = false
    
    @EnvironmentObject var orderViewModel:OrderViewModel
    
    
    var options = [0,1,2,3,4,5]
    
    init(){
        UITableView.appearance().sectionHeaderHeight = 10
        UITableView.appearance().sectionFooterHeight = 0
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        VStack{
            Form{
                rentalPeriod
                numberOfCars
                pickUpTime
                location
                drivers
                orderComplete
                NavigationLink(destination: OrderView(),isActive: $saveForm){
                    EmptyView()
                }.hidden()
            }
        }.frame(minWidth:0,maxWidth: .infinity)
    }
    
    var rentalPeriod: some View{
        
        Section{
            Picker(selection: $orderViewModel.rentalPeriod, label: Text("Rental period")){
                ForEach(0..<orderViewModel.rentalPeriods.count){
                    Text("\(orderViewModel.rentalPeriods[$0]) days")
                }
            }
        }.listRowBackground(Color.baseGray)
    }
    var numberOfCars: some View{
        
        Section{
            Picker(selection: $orderViewModel.numberOfCars, label: Text("Number of cars")){
                ForEach(0..<orderViewModel.numberOfCarsOptions.count){
                    Text("\(orderViewModel.numberOfCarsOptions[$0]) cars")
                }
            }
        }.listRowBackground(Color.baseGray)
    }
    var pickUpTime: some View{
        
        Section{
            Picker(selection: $orderViewModel.pickUpTime, label: Text("Pick-up time")){
                ForEach(0..<orderViewModel.pickUpTimes.count){
                    Text("\(orderViewModel.pickUpTimes[$0]) minutes")
                }
            }
        }.listRowBackground(Color.baseGray)
    }
    var location: some View{
        
        Section{
            Picker(selection: $orderViewModel.pickUpLocation, label: Text("Pick-up location")){
                ForEach(0..<orderViewModel.locations.count){
                    Text(orderViewModel.locations[$0])
                }
            }
            Picker(selection: $orderViewModel.returnLocation, label: Text("Return location")){
                ForEach(0..<orderViewModel.locations.count){
                    Text(orderViewModel.locations[$0])
                }
            }
        }.listRowBackground(Color.baseGray)
    }
    var drivers: some View{
        
        Section{
            Toggle(isOn: $orderViewModel.specialDriver){
                Text("Drivers")
            }.toggleStyle(SwitchToggleStyle(tint: Color.black))
        }.listRowBackground(Color.baseGray)
    }
    
    var orderComplete:some View{
        Group{
            Section{
                HStack(alignment:.center){
                    Spacer()
                    Text("$\(orderViewModel.rentalPeriods[orderViewModel.rentalPeriod]*40*orderViewModel.numberOfCarsOptions[orderViewModel.numberOfCars])")
                        .fontWeight(.bold)
                        .font(.system(size: 40))
                    Spacer()
                }
            }
            
            Section{
    
                Button(action: {
                    print("Action")
                    self.saveForm = true
                }){
                    Text("COMPLETE ORDER")
                        .font(.custom("AvenirNextCondensed-Bold", size: 23))
                        .fontWeight(.bold)
                }.frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height:40)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(8)
            }
        }
    }
}



struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
            .environmentObject(OrderViewModel())
    }
}
