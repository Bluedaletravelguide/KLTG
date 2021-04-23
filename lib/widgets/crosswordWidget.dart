import 'package:flutter/material.dart';
import 'package:word_search/word_search.dart';

class CrosswordWidget extends StatefulWidget {
  CrosswordWidget({Key key}) : super(key: key);

  @override
  _CrosswordWidgetState createState() => _CrosswordWidgetState();
}

class _CrosswordWidgetState extends State<CrosswordWidget> {
  //generate crossword char array
  //example like this : [["x","x"],["x","x"]]

  int numBoxPerRow = 6;
  double padding = 5;
  double spacing = 2;
  Size sizeBox = Size.zero;

  ValueNotifier<List<List<String>>> listChars;
  //save all answers on generate crossword data
  ValueNotifier<List<CrosswordAnswer>> answerList;
  ValueNotifier<CurrentDragObj> currentDragObj;
  ValueNotifier<List<int>> charsDone;

  @override
  void initState() {
    super.initState();
    listChars = new ValueNotifier<List<List<String>>>([]);
    answerList = new ValueNotifier<List<CrosswordAnswer>>([]);
    currentDragObj = new ValueNotifier<CurrentDragObj>(new CurrentDragObj());
    charsDone = new ValueNotifier<List<int>>([]);
    //generate char array crossword
    generateRandomWord();
  }

  @override
  Widget build(BuildContext context) {
    //get size width
    Size size = MediaQuery.of(context).size;

    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.maxFinite,
            height: size.width - padding * 2,
            color: Colors.blue,
            padding: EdgeInsets.all(padding),
            margin: EdgeInsets.all(padding),
            child: drawCrosswordBox(),
          ),
          Container(
            alignment: Alignment.center,
            //lets show list word we need solve
            child: drawAnswerList(),
          ),
        ],
      ),
    );
  }

  void onDragEnd(PointerUpEvent event) {
    print("PointerUpEvent");
    //check for value in drag line object. if not, no need to clear.
    if (currentDragObj.value.currentDragLine == null) return;

    currentDragObj.value.currentDragLine.clear();
    currentDragObj.notifyListeners();
  }

  void onDragUpdate(PointerMoveEvent event) {
    print("PointerMoveEvent");

    //highlights paths & clears if cond is not met
    generateLineOnDrag(event);

    //retrieve index on drag

    int indexFound = answerList.value.indexWhere((answer) {
      return answer.answerLines.join("-") ==
          currentDragObj.value.currentDragLine.join("-");
    });

    if (indexFound >= 0) {
      answerList.value[indexFound].done = true;
      // saves answer which complete
      charsDone.value.addAll(answerList.value[indexFound].answerLines);
      charsDone.notifyListeners();
      answerList.notifyListeners();
      onDragEnd(null);
    }
  }

  int calculateIndexBasePosLocal(Offset localPosition) {
    //retrieve size of the max box
    double maxSizeBox =
        ((sizeBox.width - (numBoxPerRow - 1) * padding) / numBoxPerRow);

    if (localPosition.dy > sizeBox.width || localPosition.dx > sizeBox.width)
      return -1;

    int x = 0, y = 0;
    double yAxis = 0, xAxis = 0;
    double yAxisStart = 0, xAxisStart = 0;

    for (var i = 0; i < numBoxPerRow; i++) {
      xAxisStart = xAxis;
      xAxis += maxSizeBox +
          (i == 0 || i == (numBoxPerRow - 1) ? padding / 2 : padding);

      if (xAxisStart < localPosition.dx && xAxis > localPosition.dx) {
        x = i;
        break;
      }
    }
    for (var i = 0; i < numBoxPerRow; i++) {
      yAxisStart = yAxis;
      yAxis += maxSizeBox +
          (i == 0 || i == (numBoxPerRow - 1) ? padding / 2 : padding);

      if (yAxisStart < localPosition.dy && yAxis > localPosition.dy) {
        y = i;
        break;
      }
    }

    return y * numBoxPerRow + x;
  }

  void generateLineOnDrag(PointerMoveEvent event) {
    //create  new list to save value when drag line is null
    if (currentDragObj.value.currentDragLine == null)
      currentDragObj.value.currentDragLine = [];

    //calculation of index array based on local position on drag
    int indexBase = calculateIndexBasePosLocal(event.localPosition);

    if (indexBase >= 0) {
      //check drag line passes 2 box
      if (currentDragObj.value.currentDragLine.length >= 2) {
        //check drag line is straight line
        WSOrientation wsOrientation;

        if (currentDragObj.value.currentDragLine[0] % numBoxPerRow ==
            currentDragObj.value.currentDragLine[1] % numBoxPerRow)
          wsOrientation = WSOrientation.vertical;
        else if (currentDragObj.value.currentDragLine[0] ~/ numBoxPerRow ==
            currentDragObj.value.currentDragLine[1] ~/ numBoxPerRow)
          wsOrientation = WSOrientation.horizontal;

        if (wsOrientation == WSOrientation.horizontal) {
          if (indexBase ~/ numBoxPerRow !=
              currentDragObj.value.currentDragLine[1] ~/ numBoxPerRow)
            onDragEnd(null);
        } else if (wsOrientation == WSOrientation.vertical) {
          if (indexBase % numBoxPerRow !=
              currentDragObj.value.currentDragLine[1] % numBoxPerRow)
            onDragEnd(null);
        } else
          onDragEnd(null);
      }

      if (!currentDragObj.value.currentDragLine.contains(indexBase))
        currentDragObj.value.currentDragLine.add(indexBase);
      else if (currentDragObj.value.currentDragLine.length >=
          2) if (currentDragObj.value.currentDragLine[
              currentDragObj.value.currentDragLine.length - 2] ==
          indexBase) onDragEnd(null);

      currentDragObj.notifyListeners();
    }
  }

  void onDragStart(int indexArray) {
    try {
      List<CrosswordAnswer> indexSelecteds = answerList.value
          .where((answer) => answer.indexArray == indexArray)
          .toList();

      //check indexSelecteds for matches
      if (indexSelecteds.length == 0) return;

      print("PointerDownEvent");
      currentDragObj.value.indexArrayOnTouch = indexArray;
      currentDragObj.notifyListeners();
    } catch (e) {}
  }

  Widget drawCrosswordBox() {
    //add listener to catch drag, push down & up
    return Listener(
      onPointerUp: (event) => onDragEnd(event),
      onPointerMove: (event) => onDragUpdate(event),
      child: LayoutBuilder(
        builder: (context, constraints) {
          sizeBox = Size(constraints.maxWidth, constraints.maxWidth);
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1,
              crossAxisCount: numBoxPerRow,
              crossAxisSpacing: padding,
              mainAxisSpacing: padding,
            ),
            itemCount: numBoxPerRow * numBoxPerRow,
            physics: ScrollPhysics(),
            itemBuilder: (context, index) {
              //we need expand because to merge 2d array to one
              //
              String char = listChars.value.expand((e) => e).toList()[index];
              Color color = Colors.yellow;
              //highlight path of the pointer that is being dragged using valuelistener
              return Listener(
                onPointerDown: (event) => onDragStart(index),
                child: ValueListenableBuilder(
                  valueListenable: currentDragObj,
                  builder: (context, CurrentDragObj value, child) {
                    //change the  color when path line contains index
                    if (value.currentDragLine.contains(index)) {
                      color = Colors.blue;
                    } else if (charsDone.value.contains(index)) {
                      color = Colors.red;
                    }

                    // if word is done, it will be highlighted red

                    return Container(
                      decoration: BoxDecoration(
                        color: color,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        char.toUpperCase(),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  void generateRandomWord() {
    //this words is the one we want put on the crossword game
    final List<String> wl = ['hello', 'world', 'bar', 'dart', 'drink', 'food'];

    //setup configuration to generate crossword

    //Create the puzzle sessting object
    final WSSettings ws = WSSettings(
      width: numBoxPerRow,
      height: numBoxPerRow,
      orientations: List.from([
        WSOrientation.horizontal,
        WSOrientation.horizontalBack,
        WSOrientation.vertical,
        WSOrientation.verticalUp,
        //WSOrientation.diagonal,
        //WSOrientation.diagonalUp,
      ]),
    );

    //Create new instance of the Word Search Class
    final WordSearch wordSearch = WordSearch();

    //Create a new puzzle
    final WSNewPuzzle newPuzzle = wordSearch.newPuzzle(wl, ws);

    //check for errors
    if (newPuzzle.errors.isEmpty) {
      //if no error.. proceed

      //List<List<String>> charsArray = newPuzzle.puzzle;
      listChars.value = newPuzzle.puzzle;
      // print("char ${charsArray.toString()}");

      //solve puzzle for given word list
      final WSSolved solved = wordSearch.solvePuzzle(newPuzzle.puzzle, wl);

      answerList.value = solved.found
          .map((solve) => new CrosswordAnswer(solve, numPerRow: numBoxPerRow))
          .toList();
      //pass array
    }
  }

  drawAnswerList() {
    return Container(
      child: ValueListenableBuilder(
        valueListenable: answerList,
        builder: (context, List<CrosswordAnswer> value, child) {
          //custom widget using Column & Row
          //
          //
          //number of row child to be shown in a row
          int perColTotal = 3;
          //generate using list.generate

          List<Widget> list = List.generate(
              (value.length ~/ perColTotal) +
                  ((value.length % perColTotal) > 0 ? 1 : 0), (int index) {
            int maxColumn = (index + 1) * perColTotal;

            return Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                //generate child row per row
                //set distance between row child equally
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                    maxColumn > value.length
                        ? maxColumn - value.length
                        : perColTotal, ((indexChild) {
                  //declare array for answerList
                  int indexArray = (index) * perColTotal + indexChild;

                  return Text(
                    //makes text easier to read
                    "${value[indexArray].wsLocation.word}",
                    style: TextStyle(
                      fontSize: 18,
                      color:
                          value[indexArray].done ? Colors.green : Colors.black,
                      decoration: value[indexArray].done
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  );
                })).toList(),
              ),
            );
          }).toList();
          return Container(
            child: Column(
              children: list,
            ),
          );
        },
      ),
    );
  }
}

class CurrentDragObj {
  Offset currentDragPos;
  Offset currentTouch;
  int indexArrayOnTouch;
  List<int> currentDragLine = [];

  CurrentDragObj({this.indexArrayOnTouch, this.currentTouch});
}

class CrosswordAnswer {
  bool done = false;
  int indexArray;
  WSLocation wsLocation;
  List<int> answerLines;

  CrosswordAnswer(this.wsLocation, {int numPerRow}) {
    this.indexArray = this.wsLocation.y * numPerRow + this.wsLocation.x;
    generateAnswerline(numPerRow);
  }

  //get answer index for each character word
  void generateAnswerline(int numPerRow) {
    //declare new list<int>
    this.answerLines = [];

    //push all index based base word array
    this.answerLines.addAll(List<int>.generate(this.wsLocation.overlap,
        (index) => generateIndexBaseonAxis(this.wsLocation, index, numPerRow)));
  }

  //calculate index base axis x&y
  generateIndexBaseonAxis(WSLocation wsLocation, int i, int numPerRow) {
    int x = wsLocation.x, y = wsLocation.y;

    if (wsLocation.orientation == WSOrientation.horizontal ||
        wsLocation.orientation == WSOrientation.horizontalBack)
      x = (wsLocation.orientation == WSOrientation.horizontal) ? x + i : x - i;
    else
      y = (wsLocation.orientation == WSOrientation.vertical) ? y + i : y - i;

    return x + y * numPerRow;
  }
}
