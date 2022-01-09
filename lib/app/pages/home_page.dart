import 'package:comicbook/app/controllers/home_controller.dart';
import 'package:comicbook/app/models/issue.dart';
import 'package:comicbook/app/widgets/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    _buildItemGrid(Issue issue, HomeController controller) {
      double imageH = (400 / 600) * 420;
      return InkWell(
        onTap: () => controller.goToDetail(issue),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: "issue_${issue.id}",
              child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0XFF20202c),
                          spreadRadius: 0,
                          blurRadius: 12,
                          offset: Offset(2, 8),
                        )
                      ]),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8), // Image border
                      child: Image.network(issue.image!,
                          fit: BoxFit.cover,
                          width: (Get.width / 2) * 0.88,
                          height: imageH))),
            ),
            const SizedBox(height: 16),
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${issue.name ?? 'N/A'} #${issue.issueNumber}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(height: 4),
                      Text(
                        Jiffy(issue.dateAdded).format('MMMM dd, yyyy'),
                        style: const TextStyle(color: Color(0xFFa6a5af)),
                      )
                    ],
                  ),
                )),
          ],
        ),
      );
    }

    _buildItemList(Issue issue, HomeController controller) {
      double imageH = (400 / 600) * (Get.width / 2);
      return Padding(
        padding: const EdgeInsets.only(bottom: 28),
        child: SizedBox(
          width: Get.width * 0.6,
          child: InkWell(
            onTap: () => controller.goToDetail(issue),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: "issue_${issue.id}",
                  child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0XFF20202c),
                              spreadRadius: 0,
                              blurRadius: 12,
                              offset: Offset(2, 8),
                            )
                          ]),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8), // Image border
                          child: Image.network(issue.image!,
                              fit: BoxFit.cover,
                              width: (Get.width / 2) * 0.5,
                              height: imageH))),
                ),
                const SizedBox(width: 16),
                Container(
                  padding: const EdgeInsets.only(top: 8),
                  width: Get.width * 0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("${issue.name ?? 'N/A'} #${issue.issueNumber}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20), maxLines: 3),
                      const SizedBox(height: 4),
                      Text(
                        Jiffy(issue.dateAdded).format('MMMM dd, yyyy'),
                        style:
                            const TextStyle(color: Color(0xFFa6a5af), fontSize: 18),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return GetBuilder<HomeController>(
        builder: (_) => Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: const Color(0xFF3b3b56),
              title: const Text('ComicBook',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            body: MainPage(
                child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, bottom: 26, top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Latest Issues",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20)),
                      Row(children: [
                        Obx(() => IconButton(
                              iconSize: 32,
                              onPressed: () => _.changeListMode(),
                              icon: Icon(Icons.view_list, color: _.listGrid.value ? Colors.white : Colors.purpleAccent,)),
                        ),
                               Obx(() => IconButton(
                              iconSize: 32,
                               onPressed: () => _.changeListMode(),
                              icon: Icon(Icons.grid_view, color: _.listGrid.value ? Colors.purpleAccent : Colors.white,)),
                        ),
                      ])
                    ],
                  ),
                ),
                Obx(
                  () => _.loading.value
                      ? const Center(child: CircularProgressIndicator())
                      : _.listGrid.value ? 
                        AlignedGridView.count(
                        itemCount: _.issues.length,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: 26,
                        itemBuilder: (context, index) =>
                            _buildItemGrid(_.issues[index], _))
                        
                      : ListView.builder(
                          
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: _.issues.length,
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemBuilder: (context, index) =>
                              _buildItemList(_.issues[index], _)),

                
                ),
              ],
            ))));
  }
}
