//
//  BitFields.swift
//  Sanstring
//
//  Created by Fabian Canas on 12/27/14.
//  Copyright (c) 2014 Fabian Canas. All rights reserved.
//

func bitSetter<T: RawOptionSetType>(value: Int) -> (T,T)->T {
    if value==1 {
        return flipOn
    } else {
        return flipOff
    }
}

func flipOn<T: RawOptionSetType>(value: T, change: T) -> T {
    return T(rawValue: value.rawValue | change.rawValue )
}

func flipOff<T: RawOptionSetType>(value: T, change: T) -> T {
    return T(rawValue: value.rawValue & ~change.rawValue )
}

func toggle<T: RawOptionSetType>(value: T, change: T) -> T {
    return T(rawValue: value.rawValue ^ change.rawValue )
}