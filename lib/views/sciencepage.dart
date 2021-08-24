import 'package:flutter/material.dart';
import 'package:flutter_news_provider/viewmodels/topstories.dart';
import 'package:flutter_news_provider/views/webview.dart';
import 'package:provider/provider.dart';

class SciencePage extends StatefulWidget {
  @override
  _SciencePageState createState() => _SciencePageState();
}

class _SciencePageState extends State<SciencePage> {
  @override
  void initState() {
    Provider.of<TopStoriesProvider>(context, listen: false)
        .getTopScienceStoriesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        title: Text(
          'Science News',
        ),
      ),
      body: SafeArea(
        child: Provider.of<TopStoriesProvider>(context, listen: true)
                .topScienceStoriesList
                .isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount:
                        Provider.of<TopStoriesProvider>(context, listen: true)
                            .topScienceStoriesList
                            .length,
                    itemBuilder: (context, index) {
                      var data =
                          Provider.of<TopStoriesProvider>(context, listen: true)
                              .topScienceStoriesList;
                      return Container(
                        child: customTile(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return WebViewWidget(
                                  url: Provider.of<TopStoriesProvider>(context,
                                          listen: false)
                                      .topScienceStoriesList[index]
                                      .url);
                            }));
                          },
                          img: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              image: DecorationImage(
                                image:
                                    NetworkImage(data[index].multimedia[2].url),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          other: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text(
                                  data[index].title,
                                  maxLines: 3,
                                  textScaleFactor: 1.0,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(1),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  data[index].topStoriesModelAbstract ?? '-',
                                  maxLines: 3,
                                  textScaleFactor: 0.6,
                                  style: TextStyle(color: Colors.black54),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
      ),
    );
  }
}

Widget customTile(
    {required Widget img, required Widget other, required VoidCallback onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 110,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 3),
              color: Colors.black12,
              spreadRadius: 2,
              blurRadius: 3),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: img,
          ),
          const Padding(
            padding: EdgeInsets.all(8),
          ),
          Expanded(
            flex: 5,
            child: other,
          ),
        ],
      ),
    ),
  );
}
