import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tree_view_fancy_demo/states.dart';
import 'package:tree_view_fancy_demo/tree_view/flutter_treeview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo of TreeView',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String _selectedNode;
  TreeViewController _treeViewController = TreeViewController();
  bool docsOpen = true;
  bool deepExpanded = true;

  @override
  void initState() {
    _treeViewController = _treeViewController.loadJSON(json: usStatesJson);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Treeview Demo'),
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          padding: EdgeInsets.all(20),
          height: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(10),
                  child: TreeView(
                    physics: BouncingScrollPhysics(),
                    allowParentSelect: true,
                    supportParentDoubleTap: true,
                    controller: _treeViewController,
                    onExpansionChanged: (key, expanded) =>
                        _expandNode(key, expanded),
                    onNodeTap: (key) {
                      debugPrint('Selected: $key');
                      setState(() {
                        _selectedNode = key;
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            elevation: 0,
                            title: Text(
                              _treeViewController.getNode(_selectedNode).label,
                            ),
                            content: Text(_treeViewController
                                .getNode(_selectedNode)
                                .asMap
                                .toString()),
                          ),
                        );
                        // Fluttertoast.showToast(
                        //   msg: _treeViewController.getNode(_selectedNode).label,
                        //   textColor: Colors.white,
                        //   backgroundColor: Colors.black,
                        // );
                        _treeViewController =
                            _treeViewController.copyWith(selectedKey: key);
                      });
                    },
                  ),
                ),
              ),
              // Container(
              //   padding: EdgeInsets.only(top: 20),
              //   alignment: Alignment.center,
              //   child: Text(_treeViewController.getNode(_selectedNode) == null
              //       ? ''
              //       : _treeViewController
              //           .getNode(_selectedNode)
              //           .asMap
              //           .toString()),
              // )
            ],
          ),
        ),
      ),
    );
  }

  _expandNode(String key, bool expanded) {
    String msg = '${expanded ? "Expanded" : "Collapsed"}: $key';
    debugPrint(msg);
    Node node = _treeViewController.getNode(key);
    if (node != null) {
      List<Node> updated;
      updated = _treeViewController.updateNode(
          key, node.copyWith(expanded: expanded));
      setState(() {
        _treeViewController = _treeViewController.copyWith(children: updated);
      });
    }
  }
}
