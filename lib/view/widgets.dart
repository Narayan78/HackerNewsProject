import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../services/stories_services.dart';
import 'comments.dart';

class TabBarWidgets extends ConsumerWidget {
  final String storyType;

  const TabBarWidgets({super.key, required this.storyType});

  @override
  Widget build(BuildContext context, ref) {
    final storyId = ref.watch(story(storyType));
    return CustomScrollView(
      shrinkWrap: true,
      slivers: [
        SliverToBoxAdapter(
          child: storyId.when(
            data: (data) {
              return ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (ctx, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height:  160,
                        padding: const EdgeInsets.all(14.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(3, 3))
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Title : ', style: TextStyle(fontWeight: FontWeight.w400 , fontSize: 17), ),
                                Flexible(
                                  child: Text(
                                    data[index].title,
                                    maxLines: 5,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 17),
                                  ),
                                ),
                            
                              ],
                            ),
                            const Divider(
                              color: Colors.grey,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('By : '),
                                Flexible(
                                    child: Text(
                                  data[index].by,
                                  maxLines: 2,
                                )),
                              ],
                            ),
                            SizedBox(height: 4.h),
                            InkWell(
                              onTap: () {
                                Get.to(
                                    () => CommentsView(storyData: data[index]),
                                    transition: Transition.leftToRightWithFade);
                              },
                              child: Row(
                                
                                
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.insert_comment, color: Colors.blue, size: 18.sp,),
                                  Text(
                                    data[index].kids.length.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.sp),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(
                                    'comments',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                        color: Colors.blue),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            },
            error: (error, stack) => Center(child: Text('$error')),
            loading: () => const Padding(
              padding: EdgeInsets.all(18.0),
              child: CupertinoActivityIndicator(
                radius: 18.0,
                color: Colors.blue,
              ),
            ),
          ),
        )
      ],
    );
  }
}
