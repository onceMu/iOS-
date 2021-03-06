//
//  Tree.m
//  Sort
//
//  Created by le on 2018/10/29.
//  Copyright © 2018 le. All rights reserved.
//

#import "Tree.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


typedef struct TreeNode {
    int data;
    struct TreeNode *leftChild;
    struct TreeNode *rightChild;
};

@implementation Tree

/*
 完全二叉树、满二叉树、平衡二叉树、红黑树、二叉查找树
 高度、深度、层
 节点的高度：节点到叶子节点的最长路径
 节点的深度：根节点到这个节点所径路的边的个数
 节点的层数：节点的深度+ 1
 树的高度：根节点的高度
 
 
 满二叉树：叶子节点全都在最底层，除了叶子节点之外，每个节点都有左右两个节点
 完全二叉树：叶子节点都在最底下两层，最后一层的叶子节点都靠左排列，并且除了最后一层，其它层的节点个数都要达到最大。
 二叉查找树： 二叉查找树要求，在树中的任意一个节点，其左子树中的每个节点的值，都要小于这个节点的值，而右子树节点的值都大于这个节点的值。
 
 二叉树的存储方法：
 1.链式存储法，左右节点、数据
 2.顺序存储法，
 
 
 二叉树遍历
 1.前序遍历，先遍历根节点，再遍历左子树，左子树遍历完成后再遍历右子树
 2.中序遍历，先遍历左子树，然后遍历根节点，再遍历右子树
 3.后序遍历，先遍历左子树，然后遍历右子树，最后遍历根节点
 
        A
    B      C
 D    E  F   G
 上面树的遍历方式
 1.前序遍历 A->B->D->E->C->F->G
 2.中序遍历 D->B->E->A->F->C->G
 3.后续遍历 D->E->B->F->G->C->A

 
 二叉树的遍历实际上是一个递归过程
 
 
 
 二叉查找树查找操作
 1.先查找根节点，如果相等就返回，如果比根节点大，就递归查找根节点的右子树，如果比根节点小，就递归查找根节点的左子树

 
 二叉树插入操作
 1.如果插入的数据比节点数据大，并且节点的右子树为空，就将新数据直接插入到右子树的位置，如果不为空，就递归遍历右子树，查找插入位置
 2.如果插入的数据比节点数据小，并且节点的左子树为空，就将新数据直接插入到左子树的尾椎，u如果不为空，就递归遍历左子树，查找插入位置
 
 
 3. 二叉查找树的删除操作
 二叉查找树的查找、插入操作都比较简单易懂，但是它的删除操作就比较复杂了 。针对要删除节点的子节点个数的不同，我们需要分三种情况来处理。
 
 第一种情况是，如果要删除的节点没有子节点，我们只需要直接将父节点中，指向要删除节点的指针置为 null。
 
 第二种情况是，如果要删除的节点只有一个子节点（只有左子节点或者右子节点），我们只需要更新父节点中，指向要删除节点的指针，让它指向要删除节点的子节点就可以了。
 
 第三种情况是，如果要删除的节点有两个子节点，这就比较复杂了。我们需要找到这个节点的右子树中的最小节点，把它替换到要删除的节点上。然后再删除掉这个最小节点，因为最小节点肯定没有左子节点（如果有左子结点，那就不是最小节点了），所以，我们可以应用上面两条规则来删除这个最小节点。
 
 */


//查找树的深度
int maxDepth(struct TreeNode *root) {
    if(root == NULL) {
        return 0;
    }
    int left = maxDepth(root ->leftChild);
    int right = maxDepth(root ->rightChild);
    return 1 + ((left > right) ? left : right);
}

//判断树是否是二叉搜索树
//二叉搜索树的是如果存在左子树、左子树比跟节点小，如果存在右子树，右子树比根节点大
//需要注意的是，要记录下左子树的最大值、以及右子树的最小值与根节点进行比较
bool checkIsBinarySearchTree(struct TreeNode *root) {
    return checkBinarySearchTree(root, LONG_MIN, LONG_MAX);
}

bool checkBinarySearchTree(struct TreeNode *root,long min,long max) {
    if (root == NULL) {
        return 1;
    }
    if (root->data <= min || root->data >= max) return false;
    return (checkBinarySearchTree(root ->leftChild, min, root ->data) && checkBinarySearchTree(root ->rightChild, root ->data, max));
}

@end
