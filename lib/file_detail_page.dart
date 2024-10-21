
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'recent_files.dart';


class FileDetailPage extends StatefulWidget {
  final String title;
  final String fileCount;

  const FileDetailPage({ Key? key,required this.title,required this.fileCount }) : super(key: key);

  @override
  State<FileDetailPage> createState() => _FileDetailPageState();
}

class _FileDetailPageState extends State<FileDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: PreferredSize(child: getAppBar(), preferredSize: Size.fromHeight(60)),
      body: getBody(),
    );
  }
  Widget getAppBar(){
    return AppBar(

      elevation: 0,
      leading: IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon: Icon(Icons.arrow_back)),
      title: Text(widget.title+" (${widget.fileCount})",style: TextStyle(
          color: Colors.black,
          fontSize: 17
      ),),
    );
  }

  Widget getBody(){
    return SingleChildScrollView(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          getDateSection(),
          SizedBox(height: 20,),
          getItemLists()
        ],
      ),
    );
  }
  Widget getDateSection(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text("Date Modified",style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600
            ),),
            SizedBox(width: 2,),
            Icon(Icons.arrow_downward_rounded,size: 20,)
          ],
        ),
        IconButton(onPressed: (){

        }, icon: Icon(Icons.multitrack_audio))
      ],
    );
  }

  Widget getItemLists(){
    var size = MediaQuery.of(context).size;
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      children: List.generate(imageFiles.length, (index) {
        return Container(
          width: (size.width-60)/2,
          height: (size.width-50)/2,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: (size.width-60)/2,
                height: 120,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                    image: DecorationImage(image: NetworkImage(imageFiles[index]['img']),fit: BoxFit.cover)
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(imageFiles[index]['file_name'],style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500
                ),),
              ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(imageFiles[index]['file_size'],style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.w500
                ),),
              ),
            ],
          ),
        );

      }),
    );
  }
}