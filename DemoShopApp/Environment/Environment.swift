//
//  Environment.swift
//  DemoShopApp
//
//  Created by Steven Zeng on 2024/3/16.
//

import Foundation

final class Environment {
    private(set) var service: Service

    init(service: Service) {
        self.service = service
    }
}
