import 'package:animate_countdown_text/animate_countdown_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TabItemPage extends StatefulWidget {
  const TabItemPage({Key? key}) : super(key: key);

  @override
  _TabState createState() => _TabState();
}

class _TabState extends State<TabItemPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    List<int> times = [];
    times.add(1000);
    return Container(
      color: Colors.white,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate((content, index) {
              return _buildItem(times[index]);
            }, childCount: times.length),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(int time) {
    DateTime dateTime = DateTime.now().add(Duration(seconds: time));
    return Row(
      children: [
        const Spacer(),
        AnimateCountdownText(
          dateTime: dateTime,
          format: _formatHMS,
          animationType: AnimationType.none,
        ),
        const Spacer(),
      ],
    );
  }

  DurationFormat _formatHMS(Duration duration) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
        duration.inSeconds * 1000,
        isUtc: true);

    // final hours = dateTime.hour < 10 ? "0${dateTime.hour}" : "${dateTime.hour}";
    // final minutes = dateTime.minute < 10 ? "0${dateTime.minute}" : "${dateTime.minute}";
    // final seconds = dateTime.second < 10 ? "0${dateTime.second}" : "${dateTime.second}";

    print("inSeconds=${duration.inSeconds}");

    return DurationFormat(
        hour: "${dateTime.hour}",
        hourSuffix: ":",
        minute: "${dateTime.minute}",
        minuteSuffix: ":",
        second: "${dateTime.second}",
        secondSuffix: "");
  }
}
