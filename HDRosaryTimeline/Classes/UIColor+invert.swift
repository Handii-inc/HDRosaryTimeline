import Foundation

extension UIColor {
    func invert() -> UIColor
    {
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 0.0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        return UIColor(red: (1 - r),
                       green: (1 - g),
                       blue: (1 - b),
                       alpha: a)
    }    
}
