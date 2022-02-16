//
//  KeyChainError.swift
//  keePeat
//
//  Created by Irene Truchado Mazzoli on 11/01/22.
//

import UIKit

public enum KeychainError: Error {
    case passwordNotFound
    case malformedData
    case unknown(status: OSStatus)
}
