import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return Container(
      child: StaggeredGrid.count(
        crossAxisCount: 2,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
        children: const [
          StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  shadowColor: Colors.black87,
                  margin: EdgeInsets.only(left: 18, right: 18, top: 18),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: ListTile(
                     
                    ),
                  ))),
          StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  shadowColor: Colors.black87,
                  margin: EdgeInsets.only(left: 18, right: 4, bottom: 18),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("2 widget"),
                  ))),
          StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  shadowColor: Colors.black87,
                  margin: EdgeInsets.only(left: 4, right: 18, bottom: 18),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("3 widget"),
                  )))
        ],
      ),
    );
  }
}
