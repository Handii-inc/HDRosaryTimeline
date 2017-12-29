import Foundation

extension UIColor {
    func adjust(brightness: CGFloat) -> UIColor
    {
        var h: CGFloat = 0;
        var s: CGFloat = 0;
        var b:CGFloat = 0;
        var a: CGFloat = 0;
        self.getHue(&h, saturation: &s, brightness: &b, alpha: &a)
        
        return UIColor(hue: h,
                       saturation: s,
                       brightness: brightness,
                       alpha: a)
    }
}
