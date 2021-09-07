import 'package:flutter/material.dart';
import '../lb_widgets/basicUsage.dart';


final List<ListViewModel> listModels = [
  ListViewModel(
    title: 'ListSliver',
    listModel: BasicDemo(title: 'ListSliver'),
  ),
];

class ListViewModel {
   final String title;
   final Widget listModel;

   ListViewModel({required this.title, required this.listModel});
}

class LBListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar : AppBar(
        title : Text('LBListViewDemo'), 
      ),
      body: ListView.builder(
        itemCount: listModels.length,
        itemBuilder: (context, index){        
          return Padding(
            padding: EdgeInsets.fromLTRB(20,20,20,0),
            
            child: RaisedButton(
              padding: EdgeInsets.symmetric(vertical:13),
              shape: RoundedRectangleBorder(
                borderRadius:BorderRadius.circular(4),
              ),
              onPressed: () {
                Navigator.push(
                  context,MaterialPageRoute(
                    builder:(context) =>  listModels[index].listModel,
                  ),
                );
              },
              child: Text(listModels[index].title),
            ),
          );
        },
      ),
    );
  }
}

class LBModel {
  final String title;

  LBModel({required this.title});
}

final List<LBModel>models = [
  LBModel(
    title: '1',
  ),
  LBModel(
    title: '2',
  ),
  LBModel(
    title: '3',
  ),
  LBModel(
    title: '4',
  ),
  LBModel(
    title: '5',
  ),
  LBModel(
    title: '6',
  ),
  LBModel(
    title: '7',
  ),
  LBModel(
    title: '8',
  ),
  LBModel(
    title: '9',
  ),
  LBModel(
    title: '10',
  ),
];