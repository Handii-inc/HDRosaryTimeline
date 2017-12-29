import Foundation

public protocol CellViewColorPalette: class {
    func coloring(textLabel: UILabel, with font: UIFont)
    func coloring(detailTextLabel: UILabel, with font: UIFont)
    func coloring(line layer: CALayer)
    func coloring(card layer: CALayer)
}
