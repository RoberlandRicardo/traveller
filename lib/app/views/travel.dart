import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:traveller/app/components/generic_screen_nivel02.dart';

class Travel extends StatefulWidget {
  const Travel({Key? key}) : super(key: key);

  @override
  _TravelState createState() => _TravelState();
}

class _TravelState extends State<Travel> {
  String state = 'not_travel';
  String _textButton = 'CADASTRAR VIAGEM';

  @override
  Widget build(BuildContext context) {
    return GenericScreen(
      currendIndex: 1,
      child: Scaffold(
        bottomNavigationBar: Material(
          color: Color.fromRGBO(245, 170, 82, 1),
          child: InkWell(
            onTap: () {
              //print('called on tap');
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: Color.fromRGBO(5, 41, 60, 1))),
              ),
              height: kToolbarHeight,
              width: double.infinity,
              child: Center(
                child: Text(
                  _textButton,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color.fromRGBO(5, 41, 60, 1)),
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Color.fromRGBO(245, 170, 82, 1),
        body: Column(
          children: [
            Spacer(),
            SvgPicture.asset(
              'assets/svgs/scrapbooking.svg',
              width: 320.0,
              height: 320.0,
            ),
            Container(
              child: Column(children: [
                Text('Você não cadastrou'),
                Text('nenhuma viagem.'),
              ]),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => throw UnimplementedError();
}
