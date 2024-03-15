//
//  Reducer.swift
//  DemoShopApp
//
//  Created by Steven Zeng on 2024/3/16.
//

import Foundation

typealias Reducer<State, Action, Environment> = (inout State, Action, Environment) -> Task<Action, Error>?
