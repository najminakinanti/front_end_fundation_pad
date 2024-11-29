import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';
import 'package:pad_fundation/widgets/mitra/event_tile_mitra.dart';
import 'package:pad_fundation/widgets/mitra/chat_bubble_mitra.dart';

class DetailChatMitra extends StatefulWidget {
  @override
  _DetailChatMitraState createState() => _DetailChatMitraState();
}

class _DetailChatMitraState extends State<DetailChatMitra> with WidgetsBindingObserver {
  late ScrollController _scrollController;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _focusNode = FocusNode();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _scrollController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    if (bottomInset > 0) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
    }
  }
  @override
  Widget build(BuildContext context) {

    PreferredSize header() {
      return PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: backgroundColor,
          centerTitle: false,
          flexibleSpace: Container(
            margin: EdgeInsets.fromLTRB(defaultMargin, defaultMargin, defaultMargin, 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        'assets/icon_panah_kiri.png',
                        width: 8,
                      ),
                    ),
                    SizedBox(width: 20),
                    Image.asset(
                      'assets/img_chat1.png',
                      width: 40,
                    ),
                    SizedBox(width: 12),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nama EO',
                          style: blackTextStyle.copyWith(
                            fontWeight: bold,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'Nama Event',
                          style: blackTextStyle.copyWith(
                            fontWeight: light,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget cardEvent() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              EventTileMitra(
                imagePath: 'assets/img_music_fest.png',
                status: 'Offline',
                title: 'Music Fest 2024',
                collectedAmount: 'Rp900.000',
                progress: 0.1,
                daysRemaining: 230,
                donorshipCount: 100,
                eventDate: '20 Mei 2024',
                categories: ['Musik', 'Hiburan', 'Live', 'EDM'],
                onTap: () {
                  print('Navigate to detail');
                },
              ),
            ],
          ),
        ),
      );
    }

    Widget chatDate() {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'Minggu, 7 April 2024',
            style: grayTextStyle.copyWith(fontSize: 14),
          ),
        ),
      );
    }

    Widget chatToday() {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'Today',
            style: grayTextStyle.copyWith(fontSize: 14),
          ),
        ),
      );
    }

    Widget chatInput() {
      return Container(
        margin: EdgeInsets.fromLTRB(defaultMargin, 8, defaultMargin, 20),
      child: Row(
          children: [
            Expanded(
              child: Container(
                height: 45,
                padding: EdgeInsets.only(left: 20, right: 5),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: grayBorderChatInput,
                  ),
                ),
                child: Center(
                  child: TextFormField(
                    focusNode: _focusNode,
                    decoration: InputDecoration(
                      hintText: 'Ketikkan Pesan',
                      hintStyle: grayChatTextStyle.copyWith(fontSize: 14, fontWeight: regular),
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        icon: Image.asset(
                          'assets/icon_send.png',
                          width: 25,
                        ),
                        onPressed: () {
                          print('Pesan dikirim');
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        controller: _scrollController,
        padding: EdgeInsets.symmetric(
            horizontal: defaultMargin
        ),
        children: [
          cardEvent(),
          chatDate(),
          ChatBubbleMitra(
            isSender: true,
            text: 'Halo, acaranya kapan ya bu',
          ),
          ChatBubbleMitra(
            isSender: false,
            text: 'Acaranya mungkin sebulan lagi, bu',
          ),
          ChatBubbleMitra(
            isSender: true,
            text: 'Baik bu, sebentar',
          ),
          ChatBubbleMitra(
            isSender: false,
            text: 'Baik, kita tunggu',
          ),
          ChatBubbleMitra(
            isSender: false,
            text: 'Baik, kita tunggu',
          ),
          ChatBubbleMitra(
            isSender: false,
            text: 'Baik, kita tunggu',
          ),
          ChatBubbleMitra(
            isSender: true,
            text: 'Halo, acaranya kapan ya bu',
          ),
          ChatBubbleMitra(
            isSender: true,
            text: 'Halo, acaranya kapan ya bu',
          ),
          ChatBubbleMitra(
            isSender: true,
            text: 'Halo, acaranya kapan ya bu',
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: header(),
      body: Column(
        children: [
          Expanded(child: content()),
          chatInput(),
        ],
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}