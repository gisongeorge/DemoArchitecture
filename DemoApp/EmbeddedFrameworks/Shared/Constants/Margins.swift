import UIKit

extension Const {
	/// All view margins.
	public enum Margin {
		/// The default margin for views which defines only the left and right insets.
		public static let `default` = UIEdgeInsets(top: 0, left: 22, bottom: 0, right: 22)

		/// The margin for cell contents.
		public static let cell = Const.Margin.default.top(8).bottom(12)

		/// The min height of a common cell.
		public static let cellMinHeight = CGFloat(50)

		/// The default gap size between views.
		public static let gap = CGFloat(8)

		/// The thickness of a separator line.
		public static let separatorThickness = CGFloat(1)
	}
}