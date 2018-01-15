import Foundation

public protocol SectionViewColorPalette: class {
    func colorting(section: UIView)
    func coloring(titleLabel: UILabel, with font: UIFont)
    func coloring(dot layer: CALayer)
    func coloring(shadow layer: CALayer)
}
