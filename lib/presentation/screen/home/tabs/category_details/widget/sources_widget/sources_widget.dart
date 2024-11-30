import 'package:flutter/material.dart';
import 'package:news_app/data/model/articles_response/Article.dart';
import 'package:news_app/data/model/source_response/source.dart';
import 'package:news_app/presentation/screen/home/tabs/category_details/widget/sources_widget/source_item_widget.dart';
import 'package:news_app/presentation/screen/home/tabs/news/articles_list_widget.dart';

class SourcesTabWidget extends StatefulWidget {
  SourcesTabWidget({super.key, required this.sources});
  List<Source> sources;

  @override
  State<SourcesTabWidget> createState() => _SourcesTabWidgetState();
}

class _SourcesTabWidgetState extends State<SourcesTabWidget> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
            dividerColor: Colors.transparent,
            indicatorColor: Colors.transparent,
            tabAlignment: TabAlignment.start,
            labelPadding: EdgeInsets.all( 8),
            onTap: (index) {
              selectedIndex = index;
              setState(() {

              });
            },
            isScrollable: true,
            tabs: widget.sources
                .map(
                  (sources) => SourceItemWidget(
                    source: sources,
                    isSelected: widget.sources.indexOf(sources)==selectedIndex,
                  ),
                )
                .toList(),
          ),
        ),
        ArticlesListWidget(source:widget.sources[selectedIndex])
      ],
    );
  }
}
