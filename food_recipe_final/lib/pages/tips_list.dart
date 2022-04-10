import 'package:flutter/material.dart';
import 'package:food_recipe_final/model/kitchen_tips.dart';
import 'package:food_recipe_final/pages/update_Tips.dart';
import 'package:food_recipe_final/theme/colors.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TipsList extends StatefulWidget {
  const TipsList({Key? key}) : super(key: key);

  @override
  State<TipsList> createState() => _TipsListState();
}

class _TipsListState extends State<TipsList> {
  List<KitchenTips> kitchenTips = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchTips();
  }

  fetchTips() async {
    setState(() {
      isLoading = true;
    });
    var url = "https://recipe-app-ctse.herokuapp.com/kitchentips/getAll";
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      for (var item in items) {
        var tipNo = item['tipNo'];
        var name = item['name'];
        var description = item['description'];

        KitchenTips kitchenTip = KitchenTips(tipNo, name, description);
        kitchenTips.add(kitchenTip);
        setState(() {
          isLoading = false;
        });
      }
    } else {
      setState(() {
        kitchenTips = [];
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listing Tips"),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    if (kitchenTips.contains(null) || kitchenTips.length < 0 || isLoading) {
      return Center(
        child: CircularProgressIndicator(
          valueColor: const AlwaysStoppedAnimation<Color>(primary),
        ),
      );
    }
    return ListView.builder(
        itemCount: kitchenTips.length,
        itemBuilder: (context, index) {
          return getCard(kitchenTips[index]);
        });
  }

  Widget getCard(item) {
    return Card(
        child: Padding(
      padding: EdgeInsets.all(10.0),
      child: ListTile(
        title: Row(
          children: <Widget>[
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://pixel4agency.com/img/idea-vector-icon-png_277457.jpg"),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  item.name.toString(),
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  item.description.toString(),
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UpdateTips(kitchenTips: item),
            ),
          );
        },
      ),
    ));
  }
}
