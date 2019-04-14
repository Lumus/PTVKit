//
//  PTVAPIAccess.swift
//  PTVKit
//
//  Created by Matt Croxson on 14/4/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

public class PTVAPIAccess {
    let environment: PTVAPIEnvironment

    public init(configuration: PTVAPIConfigurationProvider) {
        self.environment = PTVAPIEnvironment(configuration: configuration)
    }

    public func signature(for url: URL?) -> String? {
        guard let _ = url else { return nil }
        return environment.configuration.apiKey + environment.configuration.apiUserId
    }
}
