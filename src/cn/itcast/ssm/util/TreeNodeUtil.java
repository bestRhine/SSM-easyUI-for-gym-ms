//package cn.itcast.ssm.util;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//
//import cn.itcast.ssm.po.SysPermission;
//
//import java.util.ArrayList;
//
///**
// * 将数组转化为easyui的tree可以接受的对象
// * @author YAO
// *
// */
//
//public class TreeNodeUtil {
//    public static List<TreeNode> tree(List<TreeNode>nodes,Long id) {
//        //递归转化为树形
//         List<TreeNode> treeNodes=new ArrayList<TreeNode>();
//            for(TreeNode treeNode : nodes) {
//                TreeNode node=new TreeNode();
//                node.setId(treeNode.getId());
//                node.setText(treeNode.getText());
//                node.setAttributes(treeNode.getAttributes());
//                node.setIconCls(treeNode.getIconCls());
//                node.setState(treeNode.getState());
//                node.setPid(treeNode.getPid());
//                if(id==treeNode.getPid()){
//                    node.setChildren(tree(nodes, node.getId()));
//                    treeNodes.add(node);
//                }
//                  
//            }
//            return treeNodes;
//    }     
//    //转化为TreeNode节点
//    public static TreeNode toNode(SysPermission permission){
//        TreeNode node=new TreeNode();
//        node.setId(permission.getId());
//        //node.setIconCls(permission.getIcon());
//        node.setPid(permission.getParentid());
//        System.out.println(node.getPid());
//        node.setText(permission.getName());
//        node.setState(permission.getType().equalsIgnoreCase("menu")?"closed":null);
//        Map<String,Object>attributes=new HashMap<String,Object>();
//        attributes.put("url", permission.getUrl());
//        node.setAttributes(attributes);
//        return node;
//    }
//    public static List<TreeNode> toListNode(List<SysPermission> permissions){
//        List<TreeNode>nodes=new ArrayList<TreeNode>();
//        for(SysPermission permission:permissions){
//            nodes.add(toNode(permission));
//        }
//        return nodes;
//    }
//}
