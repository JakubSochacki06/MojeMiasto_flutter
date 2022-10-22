import 'package:flutter/material.dart';

class CommunityIdeaTab extends StatefulWidget {
  CommunityIdeaTab({required this.title, required this.shortDescription, required this.likesAmount});
  final String title;
  final String shortDescription;
  final int likesAmount;

  @override
  State<CommunityIdeaTab> createState() => _CommunityIdeaTabState();
}

class _CommunityIdeaTabState extends State<CommunityIdeaTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Text(
                widget.title
              ),
              SizedBox(
                height: 10,
              ),
              Text(widget.shortDescription)
            ],
          ),
          Text('${widget.likesAmount.toString()}'),
          SizedBox(
            width: 10,
          ),
          IconButton(onPressed: (){}, icon: Icon(Icons.thumb_up))
        ],
      ),
    );
  }
}
