//
//  BitFields.swift
//  Sanstring
//
//  Created by Fabian Canas on 12/27/14.
//  Copyright (c) 2014 Fabian Canas. All rights reserved.
//

func bitSetter<T: OptionSetType>(value: Int) -> (T,T)->T {
    if value==1 {
        return flipOn
    } else {
        return flipOff
    }
}

func flipOn<T: OptionSetType>(value: T, change: T) -> T {
    return T(rawValue: value.union(change).rawValue )
}

func flipOff<T: OptionSetType>(value: T, change: T) -> T {
    
    return T(rawValue: value.subtract(change).rawValue)
}

func toggle<T: OptionSetType>(value: T, change: T) -> T {
    return T(rawValue: value.exclusiveOr(change).rawValue )
}