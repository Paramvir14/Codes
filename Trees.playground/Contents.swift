import UIKit

var greeting = "Hello, playground"

class TreeNode<T> {
    var value: T
    var children: [TreeNode] = []
    init(_ value: T) {
        self.value = value
    }
    
    func addChild(_ child: TreeNode) {
        self.children.append(child)
    }
}
extension TreeNode {
    func depthFirstTraverse(_ visit: (TreeNode) -> Void) {
        visit(self)
        children.forEach { node in
            node.depthFirstTraverse(visit)
        }
    }
    
  
}
let beverages = TreeNode<String>.init("Beverages")
let hot = TreeNode<String>.init("Hot")
let cold = TreeNode<String>("Cold")

beverages.addChild(hot)
beverages.addChild(cold)

beverages.depthFirstTraverse { node in
    print(node.value)
}

/* beverages.depthFirstTraverse(visitNode)
func visitNode(node: TreeNode<String>) {
    print("Node is: \(node.value)")
}
*/
