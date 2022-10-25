import 'package:MultitaskResearch/MultiTask/cueStimulus.dart';

class ListOfCueStimulus {
  final List<CueStimulus> list;

  ListOfCueStimulus({this.list});

  factory ListOfCueStimulus.fromJson(List listOfData) {
    List<CueStimulus> res = [];

    for (var data in listOfData) {
      res.add(CueStimulus.fromJson(data));
    }

    return ListOfCueStimulus(list: res);
  }
}
