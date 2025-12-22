import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/features/home/data/models/article_model.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.articleModel});

  final ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(6.r),
            child: Image.network(
              articleModel.image!,
              height: 200.h,
              width: double.infinity,
              fit: BoxFit.cover,
            )),
      SizedBox(
          height: 12.h,
        ),
        Text(
          articleModel.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style:  TextStyle(
            color: Colors.black87,
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
         SizedBox(
          height: 8.h,
        ),
        Text(
          articleModel.subTitle ?? '',
          maxLines: 2,
          style:  TextStyle(color: Colors.grey, fontSize: 14.sp),
        )
      ],
    );
  }
}
