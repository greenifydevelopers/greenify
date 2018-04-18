//
//  HomeStruct.swift
//  Greenify
//
//  Created by Mark Khulenberg on 4/10/18.
//  Copyright © 2018 Greenify. All rights reserved.
//

import Foundation
struct EnergyWeights
{
    let HeatingWeight = 0.3
    let CoolingWeight = 0.17
    let WaterHeaterWeight = 0.14
    let LightingWeight = 0.12
    let Washer_DryerWeight = 0.13
    let OtherEnergyWeight =  0.06
    let FridgeWeight = 0.04
    let OvenWeight = 0.04
}
struct WaterWeights
{
    let ShowerWeight = 0.20
    let ToiletsWeight = 0.24
    let Faucets_SinksWeight = 0.19
    let WasherWeight = 0.17
    let LeakWeight = 0.12
    let OtherWaterWeight = 0.08
}
struct HomeStruct: Codable
{
    var StreetNumber: String
    var StreetName: String
    var ZipCode: String
    var City: String
    var State: String
    var StateAbr: String
    var HeatingRating: Double
    var Heating: ProblemsStruct
    var CoolingRating: Double
    var Cooling: ProblemsStruct
    var WaterHeaterRating: Double
    var WaterHeater: ProblemsStruct
    var LightingRating: Double
    var Lighting : ProblemsStruct
    var Washer_DryerRating: Double
    var Washer_Dryer: ProblemsStruct
    var OtherEnergyRating: Double
    var OtherEnergy : ProblemsStruct
    var FridgeRating: Double
    var Fridge: ProblemsStruct
    var OvenRating: Double
    var Oven: ProblemsStruct
    var ShowerRating: Double
    var Shower: ProblemsStruct
    var ToiletsRating: Double
    var Toilet: ProblemsStruct
    var Faucets_SinksRating: Double
    var Faucets_Sinks: ProblemsStruct
    var WasherRating: Double
    var Washer: ProblemsStruct
    var LeakRating: Double
    var Leak: ProblemsStruct
    var OtherWaterRating: Double
    var OtherWater: ProblemsStruct
    var Description: String
    //Returns a formatted version of the Homes full address
    func getFullAddress() -> String
    {
        return "\(StreetNumber) \(StreetName), \(City) \(StateAbr), \(ZipCode)"
    }
    func getHeatingRatingWeighted()->Double
    {
        return (Double(HeatingRating) * EnergyWeights.init().HeatingWeight)
    }
    func getCoolingRatingWeighted()->Double
    {
        return (Double(CoolingRating) * EnergyWeights.init().CoolingWeight)
    }
    func getWaterHeaterRatingWeighted()->Double
    {
        return (Double(WaterHeaterRating) * EnergyWeights.init().WaterHeaterWeight)
    }
    func getLightingRatingWeighted()->Double
    {
        return (Double(LightingRating) * EnergyWeights.init().LightingWeight)
    }
    func getWasher_DryerWeighted()->Double
    {
        return (Double(Washer_DryerRating) * EnergyWeights.init().Washer_DryerWeight)
    }
    func getOtherEnergyWeighted()->Double
    {
        return (Double(OtherEnergyRating) * EnergyWeights.init().OtherEnergyWeight)
    }
    func getFridgeRatingWeighted()->Double
    {
        return (Double(FridgeRating) * EnergyWeights.init().FridgeWeight)
    }
    func getOvenRatingWeighted()->Double
    {
        return (Double(OvenRating) * EnergyWeights.init().OvenWeight)
    }
    func getShowerRatingWeighted()->Double
    {
        return (Double(ShowerRating) * WaterWeights.init().ShowerWeight)
    }
    func getToiletRatingWeighted()->Double
    {
        return (Double(ToiletsRating) * WaterWeights.init().ToiletsWeight)
    }
    func getFaucets_SinksRatingWeighted()->Double
    {
        return (Double(Faucets_SinksRating) * WaterWeights.init().Faucets_SinksWeight)
    }
    func getWasherRatingWeighted()->Double
    {
        return (Double(WasherRating) * WaterWeights.init().WasherWeight)
    }
    func getLeakRatingWeighted()->Double
    {
        return (Double(LeakRating) * WaterWeights.init().LeakWeight)
    }
    func getOtherWaterRatingWeighted()->Double
    {
        return (Double(OtherWaterRating) * WaterWeights.init().OtherWaterWeight)
    }
    func getWaterRating() -> Double
    {
        return getShowerRatingWeighted() + getToiletRatingWeighted() + getFaucets_SinksRatingWeighted() + getWasherRatingWeighted() + getLeakRatingWeighted() + getOtherWaterRatingWeighted()
    }
    func getEnergyRating() -> Double
    {
        return getHeatingRatingWeighted() + getCoolingRatingWeighted() + getWaterHeaterRatingWeighted() + getLightingRatingWeighted() + getWasher_DryerWeighted() + getOtherEnergyWeighted() + getFridgeRatingWeighted() + getOvenRatingWeighted()
    }
}

struct ProblemsStruct: Codable
{
    var problems: String
    var learn: String
}

func loadJson() -> [HomeStruct]
{
    var Array: [HomeStruct]
    Array = [HomeStruct]()
    if let url = Bundle.main.url(forResource: "Homes", withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode([HomeStruct].self, from: data)
            return jsonData
        } catch {
            print("error:\(error)")
        }
    }
    return Array
}
