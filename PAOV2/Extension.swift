//
//  Extension.swift
//  QuizGameV1
//
//  Created by Duong Do Van on 3/22/19.
//  Copyright © 2019 Duong Do Van. All rights reserved.
//

import Foundation
import UIKit

extension Array {
    /// Picks `n` random elements (partial Fisher-Yates shuffle approach)
    subscript (randomPick n: Int) -> [Element] {
        var copy = self
        for i in stride(from: count - 1, to: count - n - 1, by: -1) {
            copy.swapAt(i, Int(arc4random_uniform(UInt32(i + 1))))
        }
        return Array(copy.suffix(n))
    }
    
    func randomElements(number: Int) -> [Element] {
        guard number > 0 else { return [Element]() }
        var remaining = self
        var chosen = [Element]()
        for _ in 0 ..< number {
            guard !remaining.isEmpty else { break }
            let randomIndex = Int(arc4random_uniform(UInt32(remaining.count)))
            chosen.append(remaining[randomIndex])
            remaining.remove(at: randomIndex)
        }
        return chosen
    }
    
    mutating func shuffles() {
        for i in 0..<self.count - 1 {
            let t = self[i]
            let r = Int.random(in: i + 1..<self.count)
            
            self[i] = self[r]
            self[r] = t
        }
    }
}


extension Array where Element: Hashable {
    func pickUniqueInValue(_ n: Int) -> [Element] {
        let set: Set<Element> = Set(self)
        guard set.count >= n else {
            fatalError("The array has to have at least \(n) unique values")
        }
        guard n >= 0 else {
            fatalError("The number of elements to be picked must be positive")
        }
        
        return Array(set.prefix(upTo: set.index(set.startIndex, offsetBy: n)))
    }
}


extension UIColor {
    static var mainPink = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
}


extension UIView {
    func addConstraintsWithFormat(_ format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

