//
//  User.swift
//  keePeat
//
//  Created by Irene Truchado Mazzoli on 08/01/22.
//

import UIKit

public struct User
{
    ///
    public private(set) var name: String
    ///
    public private(set) var password: String
    
    /**
 
    */
    public init(named name: String, withPassword password: String)
    {
        self.name = name
        self.password = password
    }
}
