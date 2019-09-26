//
//  asDicenary.swift
//  LawyerUp
//
//  Created by Abed Nayef Qasim on 2/18/19.
//  Copyright © 2019 Abed Nayef Qasim. All rights reserved.
//

import Foundation
public extension Encodable {
    func asDictionary() throws -> [String: AnyObject] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: AnyObject] else {
            throw NSError()
        }
        return dictionary
    }
}
