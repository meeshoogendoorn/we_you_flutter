import 'package:flutter/material.dart';

class MultipleChoiceView extends StatefulWidget {
  final answerList;
  final answer;

  const MultipleChoiceView({Key key, this.answerList, this.answer}) : super(key: key);
  @override
  MultipleChoiceViewState createState() => MultipleChoiceViewState();
}

class MultipleChoiceViewState extends State<MultipleChoiceView> {
  List<RadioModel> answerList = new List<RadioModel>();
  String answer;


  @override
  void initState() {
    answer = widget.answer;
    answerList = widget.answerList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      return new ListView.builder(
        itemCount: answerList.length,
        itemBuilder: (BuildContext context, int index) {
          return new InkWell(
            //highlightColor: Colors.red,
            splashColor: Colors.blueAccent,
            onTap: () {
              setState(() {
                answerList.forEach((element) => element.isSelected = false);
                answerList[index].isSelected = true;
                answer = answerList[index].buttonText;
                print(answer);
              });
            },
            child: new RadioItem(answerList[index]),
          );
        },
    );
  }
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;
  RadioItem(this._item);
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.all(15.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Container(
            height: 50.0,
            width: 50.0,
            child: new Center(
              child: new Text(_item.buttonText,
                  style: new TextStyle(
                      color:
                      _item.isSelected ? Colors.white : Colors.black,
                      //fontWeight: FontWeight.bold,
                      fontSize: 18.0)),
            ),
            decoration: new BoxDecoration(
              color: _item.isSelected
                  ? Theme.of(context).accentColor
                  : Colors.white,
              border: new Border.all(
                  width: 1.0,
                  color: _item.isSelected
                      ? Theme.of(context).accentColor
                      : Colors.white),
              borderRadius: const BorderRadius.all(const Radius.circular(50.0)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Theme.of(context)
                        .accentColor
                        .withOpacity(0.5),
                    offset: Offset(1.1, 1.1),
                    blurRadius: 10.0),
              ],
            ),
          ),
          new Container(
            margin: new EdgeInsets.only(left: 10.0),
            child: new Text(_item.text),
          )
        ],
      ),
    );
  }
}

class RadioModel {
  bool isSelected;
  final String buttonText;
  final String text;

  RadioModel(this.isSelected, this.buttonText, this.text);
}